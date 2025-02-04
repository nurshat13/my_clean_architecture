import 'package:my_clean_architecture/features/authentication/data/data_sources/remote/auth_api_service.dart';
import '../../../../core/network/custom_exceptions.dart';
import '../../../../core/resorces/data_state.dart';
import '../../domain/repository/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState<UserModel>> logIn({required String phone, required String password}) async {
    try {
      final userModel = await _authApiService.ligin(phone, password);

      if (userModel != null) {
        return DataSuccess(userModel);
      }

      return DataFailed(
        CustomException(
          exceptionType: ExceptionType.apiException,
          message: 'Response data is null',
        ),
      );
    } on CustomException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserModel>> register({
    required String firstName,
    required String lastName,
    required String? thirdName,
    required String phone,
    required String password,
  }) async {
    try {
      final userModel = await _authApiService.register(firstName, lastName, thirdName, phone, password);

      if (userModel != null) {
        return DataSuccess(userModel);
      }

      return DataFailed(
        CustomException(
          exceptionType: ExceptionType.apiException,
          message: 'Response data is null',
        ),
      );
    } on CustomException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState> deleteAccount() async {
    try {
      final response = await _authApiService.deleteAccount();

      return DataSuccess(response);
    } on CustomException catch (e) {
      return DataFailed(e);
    }
  }
}
