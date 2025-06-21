import 'key_value_storage_base.dart';

/// A service class for providing methods to store and retrieve key-value data
/// from common or secure storage.
class KeyValueStorageService {
  static const _accessTokenKey = 'accessToken';

  final _keyValueStorage = KeyValueStorageBase();

  Future<String?> getAccessToken() async {
    return await _keyValueStorage.getEncrypted(_accessTokenKey);
  }

  Future<void> setAccessToken(String token) async {
    await _keyValueStorage.setEncrypted(_accessTokenKey, token);
  }

  Future resetKeys() async {
    _keyValueStorage
      ..clearCommon()
      ..clearEncrypted();
  }
}
