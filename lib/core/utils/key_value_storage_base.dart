import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Base class containing a unified API for key-value pairs' storage.
/// This class provides low level methods for storing:
/// - Sensitive keys using [FlutterSecureStorage]
/// - Insensitive keys using [SharedPreferences]
class KeyValueStorageBase {
  /// Instance of shared preferences
  static SharedPreferences? _sharedPrefs;

  /// Instance of flutter secure storage
  static FlutterSecureStorage? _secureStorage;

  /// Singleton instance of KeyValueStorage Helper
  static KeyValueStorageBase? _instance;

  /// Get instance of this class
  factory KeyValueStorageBase() => _instance ?? const KeyValueStorageBase._();

  /// Private constructor
  const KeyValueStorageBase._();

  /// Initializer for shared prefs and flutter secure storage
  /// Should be called in main before runApp and
  /// after WidgetsBinding.FlutterInitialized(), to allow for synchronous tasks
  /// when possible.
  static Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();

    try {
      _secureStorage ??= const FlutterSecureStorage(
        aOptions: AndroidOptions(resetOnError: true),
      );

      // Try a simple read to trigger decryption if storage exists
      await _secureStorage!.containsKey(key: '__dummy__');
    } on PlatformException catch (e) {
      debugPrint('SecureStorage init error: $e');

      await recoverSecureStorage();

      // Re-initialize after recovery
      _secureStorage = const FlutterSecureStorage(
        aOptions: AndroidOptions(resetOnError: true),
      );
    }
  }


  /// Reads the value for the key from common preferences storage
  T? getCommon<T>(String key) {
    try {
      switch (T) {
        case const (String):
          return _sharedPrefs!.getString(key) as T?;
        case const (int):
          return _sharedPrefs!.getInt(key) as T?;
        case const (bool):
          return _sharedPrefs!.getBool(key) as T?;
        case const (double):
          return _sharedPrefs!.getDouble(key) as T?;
        default:
          return _sharedPrefs!.get(key) as T?;
      }
    } on Exception catch (ex) {
      debugPrint('$ex');
      return null;
    }
  }

  /// Reads the decrypted value for the key from secure storage
  Future<String?> getEncrypted(String key) async {
    try {
      return await _secureStorage!.read(key: key);
    } on PlatformException catch (ex) {
      debugPrint('SecureStorage Read Error for key [$key]: $ex');

      if (ex.message?.contains('AEADBadTagException') == true || ex.message?.contains('VERIFICATION_FAILED') == true) {
        debugPrint('SecureStorage decryption failed. Triggering recovery...');
        await recoverSecureStorage();
      }

      return null;
    }
  }

  static Future<void> recoverSecureStorage() async {
    try {
      await _secureStorage?.deleteAll(); // Use with caution – this wipes secure data
    } catch (e) {
      debugPrint('SecureStorage recovery failed: $e');
    }
  }

  /// Sets the value for the key to common preferences storage
  Future<bool> setCommon<T>(String key, T value) async {
    switch (T) {
      case const (String):
        return await _sharedPrefs!.setString(key, value as String);
      case const (int):
        return await _sharedPrefs!.setInt(key, value as int);
      case const (bool):
        return await _sharedPrefs!.setBool(key, value as bool);
      case const (double):
        return await _sharedPrefs!.setDouble(key, value as double);
      default:
        return await _sharedPrefs!.setString(key, value as String);
    }
  }

  /// Sets the encrypted value for the key to secure storage
  Future<bool> setEncrypted(String key, String value) async {
    try {
      await _secureStorage!.write(key: key, value: value);
      return await Future.value(true);
    } on PlatformException catch (ex) {
      debugPrint('$ex');
      return await Future.value(false);
    }
  }

  /// Erases common preferences keys
  Future<bool> clearCommon() async => await _sharedPrefs!.clear();

  Future<bool> removeCommon(String key) async => await _sharedPrefs!.remove(key);

  /// Erases encrypted keys
  Future<bool> clearEncrypted() async {
    try {
      await _secureStorage!.deleteAll();
      return true;
    } on PlatformException catch (ex) {
      debugPrint('$ex');
      return false;
    }
  }
}
