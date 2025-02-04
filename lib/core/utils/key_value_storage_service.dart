import 'key_value_storage_base.dart';

/// A service class for providing methods to store and retrieve key-value data
/// from common or secure storage.
class KeyValueStorageService {
  static const _accessTokenKey = 'accessToken';

  final _keyValueStorage = KeyValueStorageBase();

  Future<String?> getAccessToken() async {
    return await _keyValueStorage.getEncrypted(_accessTokenKey);
  }

  void setAccessToken(String token) {
    _keyValueStorage.setEncrypted(_accessTokenKey, token);
  }

  void resetKeys() {
    _keyValueStorage
      ..clearCommon()
      ..clearEncrypted();
  }
}
