import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:my_clean_architecture/core/utils/key_value_storage_service.dart';

part 'global_auth_event.dart';
part 'global_auth_state.dart';
part 'global_auth_bloc.freezed.dart';

class GlobalAuthBloc extends Bloc<GlobalAuthEvent, GlobalAuthState> {
  GlobalAuthBloc() : super(GlobalAuthState(status: GlobalAuthStatus.unknown)) {
    on<GlobalAuthEvent>(
      (event, emit) async {
        await event.map(
          changeStatus: (_ChangeStatus e) async => await _changeStatus(e, emit),
          checkIfLoggedIn: (_CheckIfLoggedIn e) async => await _checkIfLoggedIn(e, emit),
          logOut: (_LogOut e) async => await _logOut(e, emit),
        );
      },
    );
  }

  _changeStatus(_ChangeStatus event, Emitter<GlobalAuthState> emit) {
    emit(GlobalAuthState(status: event.status));
  }

  _checkIfLoggedIn(_CheckIfLoggedIn event, Emitter<GlobalAuthState> emit) async {
    final token = await GetIt.I.get<KeyValueStorageService>().getAccessToken();
    emit(GlobalAuthState(
      status: token != null ? GlobalAuthStatus.authenticated : GlobalAuthStatus.unauthenticated,
    ));
    // splash будет стоять пока не узнаем есть ли accessToken
    // FlutterNativeSplash.remove();
  }

  
  _logOut(_LogOut event, Emitter<GlobalAuthState> emit) async {
    GetIt.I.get<KeyValueStorageService>().resetKeys();
    emit(GlobalAuthState(status: GlobalAuthStatus.unauthenticated));
  }
}
