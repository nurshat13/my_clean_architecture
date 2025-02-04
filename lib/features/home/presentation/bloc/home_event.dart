part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getPosts({String? searchId}) = GetPosts;
  const factory HomeEvent.getPostByID(int id) = GetPostByID;
}
