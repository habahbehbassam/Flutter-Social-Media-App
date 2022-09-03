import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_app/core/usecase/usecase.dart';
import 'package:flutter_social_media_app/features/users_list/domain/usecases/get_user_with_posts.dart';
import 'package:flutter_social_media_app/features/users_list/presentation/bloc/user_list_event.dart';
import 'package:flutter_social_media_app/features/users_list/presentation/bloc/user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final GetUserWithPosts getUserWithPosts;

  UserListBloc({required this.getUserWithPosts}) : super(Empty()) {
    on<GetUserListsWithPostsNumberEvent>(
      (event, emit) => _handleOnGetUserListCalled(event, emit),
    );
  }

  _handleOnGetUserListCalled(
    GetUserListsWithPostsNumberEvent event,
    Emitter<UserListState> emit,
  ) async {
    emit(Loading());
    final failureOrUsers = await getUserWithPosts.call(NoParams());
    emit(
      failureOrUsers.fold(
        (failure) => Error(failure),
        (usersWithPosts) => Loaded(usersWithPosts),
      ),
    );
  }
}
