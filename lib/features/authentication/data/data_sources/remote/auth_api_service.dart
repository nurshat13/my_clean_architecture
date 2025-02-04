import 'package:my_clean_architecture/core/network/api_endpoints.dart';
import 'package:my_clean_architecture/core/network/network_client.dart';
import 'package:my_clean_architecture/features/authentication/data/models/user_model.dart';
import 'package:my_clean_architecture/injection_container.dart';

class AuthApiService {
  AuthApiService();
  final NetworkClient _networkClient = sl.get<NetworkClient>();

  Future<UserModel?> ligin(String phone, String password) async => await _networkClient.postData<UserModel>(
        endpoint: AuthEndpoint.login.path,
        body: {
          'phone': phone,
          'password': password,
        },
        parser: (data) {
          return UserModel.fromJson(data['user']);
        },
        requiresAuthToken: false,
      );

  Future<UserModel?> register(
    String firstName,
    String lastName,
    String? thirdName,
    String phone,
    String password,
  ) async {
    Map<String, dynamic> body = {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'password': password,
    };
    if (thirdName != null) {
      body['third_name'] = thirdName;
    }

    return await _networkClient.postData<UserModel>(
      endpoint: AuthEndpoint.register.path,
      body: body,
      parser: (data) {
        return UserModel.fromJson(data);
      },
      requiresAuthToken: false,
    );
  }

  Future<dynamic> deleteAccount() async => await _networkClient.deleteData(
        endpoint: AuthEndpoint.deleteAccount.path,
        parser: null,
      );
}
