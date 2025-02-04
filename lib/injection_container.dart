import 'package:get_it/get_it.dart';
import 'package:my_clean_architecture/core/utils/service_locator.dart';
import 'package:my_clean_architecture/features/home/data/data_sources/remote/home_api_service.dart';
import 'package:my_clean_architecture/features/home/data/repository/home_repository_impl.dart';
import 'package:my_clean_architecture/features/home/domain/usecases/get_post_list_usecase.dart';
import 'package:my_clean_architecture/features/home/domain/usecases/get_post_usecase.dart';

import 'features/authentication/presentation/bloc/global_auth/global_auth_bloc.dart';
import 'features/home/domain/repository/home_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  await setupKeyValueStorageService();
  setupApiService();
  GetIt.I.registerSingleton<GlobalAuthBloc>(
    GlobalAuthBloc()..add(GlobalAuthEvent.checkIfLoggedIn()),
  );

  /*
     * * HOME
     */

  sl.registerSingleton<HomeApiService>(HomeApiService());
  // Dependencies
  sl.registerSingleton<HomeRepository>(HomeRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetPostsUseCase>(GetPostsUseCase(sl()));
  sl.registerSingleton<GetPostBuIDUseCase>(GetPostBuIDUseCase(sl()));
}
