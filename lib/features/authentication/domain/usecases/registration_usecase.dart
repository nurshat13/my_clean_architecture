import '../../../../core/resorces/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/user_model.dart';
import '../repository/auth_repository.dart';

class RegistrationUsecase implements UseCase<DataState<UserModel>, Map<String, dynamic>> {
  final AuthRepository _authRepository;
  RegistrationUsecase(this._authRepository);

  @override
  Future<DataState<UserModel>> call({Map<String, dynamic>? params}) async {
    return await _authRepository.register(
      firstName: params!['first_name'],
      lastName: params['last_name'],
      thirdName: params.containsKey('third_name') ? params['third_name'] : null,
      phone: params['phone'],
      password: params['password'],
    );
  }
}
