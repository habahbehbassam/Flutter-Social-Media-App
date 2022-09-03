import 'dart:convert';

import 'package:flutter_social_media_app/core/network/api_constants.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/post_model.dart';
import 'package:http/http.dart ' as http;

abstract class PostsRemoteDataSource {
  Future<List<PostModel>> getPosts();
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final http.Client httpClient;

  PostsRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await httpClient.get(
      Uri.parse(getPostsApi),
    );

    if (response.statusCode == 200) {
      final List<dynamic> posts = json.decode(response.body);
      return posts.map((userJson) {
        return PostModel.fromJson(userJson);
      }).toList();
    } else {
      throw ServerException();
    }
  }
}
