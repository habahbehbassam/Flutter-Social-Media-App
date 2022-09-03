import 'package:dartz/dartz.dart';
import 'package:flutter_social_media_app/core/errors/failures.dart';
import 'package:flutter_social_media_app/core/usecase/usecase.dart';
import 'package:flutter_social_media_app/features/users_list/domain/repositories/users_posts_repository.dart';
import 'package:flutter_social_media_app/features/users_list/data/models/user_with_posts_model.dart';

class GetUserWithPosts extends UseCase<List<UserWithPostsModel>, NoParams> {
  final UsersPostsRepository repository;

  GetUserWithPosts({required this.repository});

  @override
  Future<Either<Failure, List<UserWithPostsModel>>> call(
      NoParams params) async {
    return await repository.getUserWithPosts();
  }
}
