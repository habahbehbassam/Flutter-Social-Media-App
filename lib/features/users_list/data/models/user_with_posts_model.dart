import 'package:flutter_social_media_app/features/users_list/data/models/post_model.dart';
import 'package:flutter_social_media_app/features/users_list/data/models/user_model.dart';

class UserWithPostsModel {
  final UserModel user;
  final List<PostModel> posts;

  UserWithPostsModel({
    required this.user,
    required this.posts,
  });
}
