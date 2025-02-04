import 'package:my_clean_architecture/core/network/custom_exceptions.dart';
import 'package:my_clean_architecture/core/resorces/data_state.dart';
import 'package:my_clean_architecture/features/home/data/data_sources/remote/home_api_service.dart';
import 'package:my_clean_architecture/features/home/data/models/post_model.dart';
import 'package:my_clean_architecture/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApiService _homeApiService;

  HomeRepositoryImpl(this._homeApiService);

  @override
  Future<DataState<List<PostModel>>> getPosts(String? searchId) async {
    try {
      List<PostModel>? data = await _homeApiService.getPosts(searchId);
      if (data != null) {
        return DataSuccess(data);
      } else {
        return DataFailed(CustomException(message: ''));
      }
    } on CustomException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<PostModel>> getPostByID(int id) async {
    try {
      PostModel? data = await _homeApiService.getPostByID(id);
      if (data != null) {
        return DataSuccess(data);
      } else {
        return DataFailed(CustomException(message: ''));
      }
    } on CustomException catch (e) {
      return DataFailed(e);
    }
  }
}
