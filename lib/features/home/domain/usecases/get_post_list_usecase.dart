import 'package:my_clean_architecture/core/resorces/data_state.dart';
import 'package:my_clean_architecture/core/usecase/usecase.dart';
import 'package:my_clean_architecture/features/home/data/models/post_model.dart';
import 'package:my_clean_architecture/features/home/domain/repository/home_repository.dart';

class GetPostsUseCase implements UseCase<DataState<List<PostModel>>, String?> {
  final HomeRepository _homeRepository;
  GetPostsUseCase(this._homeRepository);

  @override
  Future<DataState<List<PostModel>>> call({String? params}) async {
    return await _homeRepository.getPosts(params);
  }
}
