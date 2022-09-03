import 'package:flutter_social_media_app/features/users_list/data/models/user_with_posts_model.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/user_with_posts_model.dart';

abstract class UserListState {
  UserListState([List props = const <dynamic>[]]);
}

class Empty extends UserListState {}

class Loading extends UserListState {}

class Error extends UserListState {
  final Failure failure;

  Error(this.failure) : super([failure]);
}

class Loaded extends UserListState {
  final List<UserWithPostsModel> userWithPostsModel;

  Loaded(this.userWithPostsModel) : super([userWithPostsModel]);
}
