import 'package:dio/dio.dart';
import 'package:feed_tab/models/user_model.dart';

class FeedRepository {
  final Dio dio;

  String baseUrl = "https://dev.api.spotlas.com/interview/feed?page=1";

  FeedRepository(this.dio);

  Future<List<UserModel>> getUsers() async {
    final response = await dio.get(baseUrl);
    final data = List<Map<String, dynamic>>.from(response.data);
    final users = data.map((e) => UserModel.fromMap(e)).toList();
    return users;
  }
}
