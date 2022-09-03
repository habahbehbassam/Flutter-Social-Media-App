import 'package:dartz/dartz.dart';
import 'package:flutter_social_media_app/core/errors/failures.dart';

import '../../data/models/user_with_posts_model.dart';

abstract class UsersPostsRepository {
  Future<Either<Failure, List<UserWithPostsModel>>> getUserWithPosts();
}
