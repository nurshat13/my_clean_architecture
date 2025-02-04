import 'package:my_clean_architecture/core/resorces/data_state.dart';
import 'package:my_clean_architecture/core/usecase/usecase.dart';
import 'package:my_clean_architecture/features/home/data/models/post_model.dart';
import 'package:my_clean_architecture/features/home/domain/repository/home_repository.dart';

class GetPostBuIDUseCase implements UseCase<DataState<PostModel>, int> {
  final HomeRepository _homeRepository;
  GetPostBuIDUseCase(this._homeRepository);

  @override
  Future<DataState<PostModel>> call({int? params}) async {
    return await _homeRepository.getPostByID(params!);
  }
}
