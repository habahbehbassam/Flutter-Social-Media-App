import 'dart:convert';

import 'package:flutter_social_media_app/core/errors/exceptions.dart';
import 'package:flutter_social_media_app/core/network/api_constants.dart';
import 'package:flutter_social_media_app/features/users_list/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UsersRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final http.Client httpClient;

  UsersRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await httpClient.get(
      Uri.parse(getUsersApi),
    );

    if (response.statusCode == 200) {
      final List<dynamic> users = json.decode(response.body);
      return users.map((userJson) {
        return UserModel.fromJson(userJson);
      }).toList();
    } else {
      throw ServerException();
    }
  }
}
