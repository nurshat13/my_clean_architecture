part of 'global_auth_bloc.dart';

enum GlobalAuthStatus { unknown, authenticated, unauthenticated }

@freezed
class GlobalAuthState with _$GlobalAuthState {
  const factory GlobalAuthState({required GlobalAuthStatus status}) = _GlobalAuthState;
}
