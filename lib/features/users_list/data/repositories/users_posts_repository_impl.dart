import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/users_remote_data_source.dart';
import '../models/user_with_posts_model.dart';
import '../../domain/repositories/users_posts_repository.dart';
import '../datasources/posts_remote_data_source.dart';

class UserPostsRepositoryImpl implements UsersPostsRepository {
  final UsersRemoteDataSource usersRemoteDataSource;
  final PostsRemoteDataSource postsRemoteDataSource;
  final NetworkInfo networkInfo;

  UserPostsRepositoryImpl({
    required this.usersRemoteDataSource,
    required this.postsRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<UserWithPostsModel>>> getUserWithPosts() async {
    if (!await networkInfo.isConnected) return Left(NetworkFailure());
    try {
      final users = await usersRemoteDataSource.getUsers();
      final posts = await postsRemoteDataSource.getPosts();
      final usersWithPosts = users.map((user) {
        return UserWithPostsModel(
          user: user,
          posts: posts.where((post) => post.userId == user.userId).toList(),
        );
      }).toList();
      return Right(usersWithPosts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
