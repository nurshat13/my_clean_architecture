import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_clean_architecture/core/mixin/bloc_operations_mixin.dart';
import 'package:my_clean_architecture/core/network/custom_exceptions.dart';
import 'package:my_clean_architecture/features/home/data/models/post_model.dart';
import 'package:my_clean_architecture/features/home/domain/usecases/get_post_list_usecase.dart';
import 'package:my_clean_architecture/features/home/domain/usecases/get_post_usecase.dart';
import 'package:my_clean_architecture/injection_container.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with BlocEventHandlerMixin<HomeEvent, HomeState> {
  final GetPostsUseCase _getPostsUseCase = sl();
  final GetPostBuIDUseCase _getPostBuIDUseCase = sl();
  HomeBloc() : super(_Initial()) {
    on<HomeEvent>((events, emit) async {
      await events.map(
        getPosts: (GetPosts value) async => await handleEvent<List<PostModel>>(
          operation: () async => await _getPostsUseCase.call(params: value.searchId),
          emit: emit,
          onLoading: HomeState.getPostsLoading,
          onSuccess: (data) async => HomeState.getPostsFetched(data),
          onFailure: (error) async => HomeState.getPostByIDFailure(error),
        ),
        getPostByID: (GetPostByID value) async => await handleEvent<PostModel>(
          operation: () async => await _getPostBuIDUseCase.call(params: value.id),
          emit: emit,
          onLoading: HomeState.getPostByIDLoading,
          onSuccess: (data) async => HomeState.getPostByIDFetched(data),
          onFailure: (error) async => HomeState.getPostByIDFailure(error),
        ),
      );
    });
  }
}
