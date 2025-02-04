part of 'global_auth_bloc.dart';

@freezed
class GlobalAuthEvent with _$GlobalAuthEvent {
  const factory GlobalAuthEvent.changeStatus({
    required GlobalAuthStatus status,
  }) = _ChangeStatus;

  const factory GlobalAuthEvent.checkIfLoggedIn() = _CheckIfLoggedIn;

  const factory GlobalAuthEvent.logOut() = _LogOut;
}
