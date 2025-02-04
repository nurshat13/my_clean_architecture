import 'package:my_clean_architecture/core/network/network_client.dart';
import 'package:my_clean_architecture/features/home/data/models/post_model.dart';
import 'package:my_clean_architecture/injection_container.dart';

class HomeApiService {
  HomeApiService();
  final NetworkClient _networkClient = sl.get<NetworkClient>();

  Future<dynamic> getPosts(String? searchId) => _networkClient.getListData<PostModel>(
        endpoint: '/posts',
        queryParams: {if (searchId != null && searchId.isNotEmpty) 'id': searchId},
        parser: (response) => PostModel.fromList(response),
      );
  Future<dynamic> getPostByID(int id) => _networkClient.getData<PostModel>(
        endpoint: '/posts/$id',
        parser: (response) => PostModel.fromJson(response),
      );
}
