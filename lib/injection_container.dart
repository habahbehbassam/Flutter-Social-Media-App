import 'package:flutter_social_media_app/features/change_language/data/datasources/selected_language_local_data_source.dart';
import 'package:flutter_social_media_app/features/change_language/data/repositories/selected_language_repository_impl.dart';
import 'package:flutter_social_media_app/features/change_language/domain/repositories/selected_language_repository.dart';
import 'package:flutter_social_media_app/features/change_language/domain/usecases/cache_selected_language.dart';
import 'package:flutter_social_media_app/features/change_language/domain/usecases/get_selected_language.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/change_language/presentation/bloc/selected_language_bloc.dart';
import 'features/users_list/data/datasources/posts_remote_data_source.dart';
import 'features/users_list/data/datasources/users_remote_data_source.dart';
import 'features/users_list/data/repositories/users_posts_repository_impl.dart';
import 'features/users_list/domain/repositories/users_posts_repository.dart';
import 'features/users_list/domain/usecases/get_user_with_posts.dart';
import 'features/users_list/presentation/bloc/user_list_bloc.dart';

final serviceLocator = GetIt.asNewInstance();

Future<void> init() async {
  // Features
  // - Users List
  // Bloc
  serviceLocator.registerFactory(
    () => UserListBloc(getUserWithPosts: serviceLocator()),
  );
  // UseCase
  serviceLocator.registerLazySingleton(
    () => GetUserWithPosts(repository: serviceLocator()),
  );
  // Repository
  serviceLocator.registerLazySingleton<UsersPostsRepository>(
    () => UserPostsRepositoryImpl(
      usersRemoteDataSource: serviceLocator(),
      postsRemoteDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );
  // Data Sources
  serviceLocator.registerLazySingleton<UsersRemoteDataSource>(
    () => UsersRemoteDataSourceImpl(httpClient: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSourceImpl(httpClient: serviceLocator()),
  );
  // - User Posts

  // Selected Language
  // Bloc
  serviceLocator.registerFactory(
    () => SelectedLanguageBloc(
      cacheSelectedLanguage: serviceLocator(),
      getSelectedLanguage: serviceLocator(),
    ),
  );
  // UseCase
  serviceLocator.registerLazySingleton(
    () => GetSelectedLanguage(
      selectedLanguageRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => CacheSelectedLanguage(
      selectedLanguageRepository: serviceLocator(),
    ),
  );
  // Repository
  serviceLocator.registerLazySingleton<SelectedLanguageRepository>(
    () => SelectedLanguageRepositoryImpl(
      selectedLanguageLocalDataSource: serviceLocator(),
    ),
  );
  // Data Sources
  serviceLocator.registerLazySingleton<SelectedLanguageLocalDataSource>(
    () => SelectedLanguageLocalDataSourceImpl(
      sharedPreferences: serviceLocator(),
    ),
  );

  // Core
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: serviceLocator()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
