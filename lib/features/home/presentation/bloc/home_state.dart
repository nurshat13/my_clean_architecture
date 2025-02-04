part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  // get posts
  const factory HomeState.getPostsLoading() = GetPostsLoading;
  const factory HomeState.getPostsFetched(List<PostModel> posts) = GetPostsFetched;
  const factory HomeState.getPostsFailure(CustomException error) = GetPostsFailure;
  // get post b id
  const factory HomeState.getPostByIDLoading() = GetPostByIDLoading;
  const factory HomeState.getPostByIDFetched(PostModel post) = GetPostByIDFetched;
  const factory HomeState.getPostByIDFailure(CustomException error) = GetPostByIDFailure;
}
