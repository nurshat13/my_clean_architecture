import 'package:my_clean_architecture/core/resorces/data_state.dart';
import 'package:my_clean_architecture/features/home/data/models/post_model.dart';

abstract class HomeRepository {
  // API methods
  Future<DataState<List<PostModel>>> getPosts(String? searchId);
  Future<DataState<PostModel>> getPostByID(int id);

  // Database methods
}
