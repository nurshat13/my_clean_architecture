import 'package:my_clean_architecture/core/resorces/data_state.dart';
import 'package:my_clean_architecture/features/authentication/data/models/user_model.dart';

abstract class AuthRepository {
  Future<DataState<UserModel>> logIn({required String phone, required String password});

  Future<DataState<UserModel>> register({
    required String firstName,
    required String lastName,
    required String? thirdName,
    required String phone,
    required String password,
  });

  Future<DataState> deleteAccount();
}
