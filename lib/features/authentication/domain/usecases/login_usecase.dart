import '../../../../core/resorces/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/user_model.dart';
import '../repository/auth_repository.dart';

class LoginUsecase implements UseCase<DataState<UserModel>, Map<String, dynamic>> {
  final AuthRepository _authRepository;
  LoginUsecase(this._authRepository);

  @override
  Future<DataState<UserModel>> call({Map<String, dynamic>? params}) async {
    return await _authRepository.logIn(phone: params!['phone'], password: params['password']);
  }
}
