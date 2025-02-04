// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_clean_architecture/core/utils/key_value_storage_service.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:tuple/tuple.dart';
import '../../../features/authentication/presentation/bloc/global_auth/global_auth_bloc.dart';

class ApiInterceptor extends Interceptor {
  final bool enableEncryption;
  final bool enableDecryption;

  ApiInterceptor({this.enableEncryption = false, this.enableDecryption = false}) : super();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await GetIt.I<KeyValueStorageService>().getAccessToken();
    options.headers.addAll(
      <String, Object?>{'Authorization': '$token'},
    );

    if (enableEncryption && options.data is String) {
      options.data = encryptWithAES("secret-key", options.data);
    }

    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final statusCode = response.statusCode ?? 0;
    final success = statusCode >= 200 && statusCode < 300;
    if (enableDecryption && response.data is String) {
      response.data = decryptAES(response.data, "secret-key");
    }

    if (success) {
      return handler.next(response);
    }

    return handler.reject(
      DioException(
        requestOptions: response.requestOptions,
        response: response,
      ),
    );
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      GetIt.I<KeyValueStorageService>().resetKeys();
      GetIt.I<GlobalAuthBloc>().add(GlobalAuthEvent.logOut());
    }
    return handler.next(err);
  }

  ///шифрование AES
  String encryptWithAES(String passphrase, String plainText) {
    try {
      final salt = genRandomWithNonZero(8);
      var keyndIV = deriveKeyAndIV(passphrase, salt);
      final key = encrypt.Key(keyndIV.item1);
      final iv = encrypt.IV(keyndIV.item2);
      final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: "PKCS7"));
      final encrypted = encrypter.encrypt(plainText, iv: iv);
      Uint8List encryptedBytesWithoutSalt = Uint8List.fromList(encrypted.bytes);
      return base64.encode(encryptedBytesWithoutSalt).replaceAll('/', 'SiZd8muVgR');
    } catch (error) {
      throw error;
    }
  }

  String decryptAES(String encrypted, String passphrase) {
    try {
      Uint8List encryptedBytesWithSalt = base64.decode(encrypted);
      Uint8List encryptedBytes = encryptedBytesWithSalt.sublist(16, encryptedBytesWithSalt.length);
      final salt = encryptedBytesWithSalt.sublist(8, 16);
      var IVkeys = getIVkeys(passphrase, salt);
      final key = encrypt.Key(IVkeys.item1);
      final iv = encrypt.IV(IVkeys.item2);
      final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: "PKCS7"));
      final decrypted = encrypter.decrypt64(base64.encode(encryptedBytes), iv: iv);
      return decrypted;
    } catch (error) {
      throw error;
    }
  }

  Tuple2<Uint8List, Uint8List> getIVkeys(String passphrase, Uint8List salt) {
    var password = createUint8ListFromString(passphrase);
    Uint8List concatenatedHashes = Uint8List(0);
    Uint8List currentHash = Uint8List(0);
    bool enoughBytesForKey = false;
    Uint8List preHash = Uint8List(0);

    while (!enoughBytesForKey) {
      //int preHashLength = currentHash.length + password.length + salt.length;
      if (currentHash.isNotEmpty) {
        preHash = Uint8List.fromList(currentHash + password + salt);
      } else {
        preHash = Uint8List.fromList(password + salt);
      }
      currentHash = Uint8List.fromList(md5.convert(preHash).bytes);
      concatenatedHashes = Uint8List.fromList(concatenatedHashes + currentHash);
      if (concatenatedHashes.length >= 48) enoughBytesForKey = true;
    }

    var keyBtyes = concatenatedHashes.sublist(0, 32);
    var ivBtyes = concatenatedHashes.sublist(32, 48);
    return Tuple2(keyBtyes, ivBtyes);
  }

  Tuple2<Uint8List, Uint8List> deriveKeyAndIV(String passphrase, Uint8List salt) {
    var password = createUint8ListFromString(passphrase);
    Uint8List concatenatedHashes = Uint8List(0);
    Uint8List? currentHash = Uint8List(0);
    bool enoughBytesForKey = false;
    Uint8List preHash = Uint8List(0);

    while (!enoughBytesForKey) {
      int preHashLength = currentHash!.length + password.length + salt.length;
      if (currentHash.isNotEmpty) {
        preHash = Uint8List.fromList(currentHash + password + salt);
      } else {
        preHash = Uint8List.fromList(password + salt);
      }

      currentHash = md5.convert(preHash).bytes as Uint8List?;
      concatenatedHashes = Uint8List.fromList(concatenatedHashes + currentHash!);
      if (concatenatedHashes.length >= 48) enoughBytesForKey = true;
    }

    var keyBtyes = concatenatedHashes.sublist(0, 32);
    var ivBtyes = concatenatedHashes.sublist(32, 48);
    return Tuple2(keyBtyes, ivBtyes);
  }

  Uint8List createUint8ListFromString(String s) {
    var ret = Uint8List(s.length);
    for (var i = 0; i < s.length; i++) {
      ret[i] = s.codeUnitAt(i);
    }
    return ret;
  }

  Uint8List genRandomWithNonZero(int seedLength) {
    final random = math.Random.secure();
    const int randomMax = 245;
    final Uint8List uint8list = Uint8List(seedLength);
    for (int i = 0; i < seedLength; i++) {
      uint8list[i] = random.nextInt(randomMax) + 1;
    }
    return uint8list;
  }
}
