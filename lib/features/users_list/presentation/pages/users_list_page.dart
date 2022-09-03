import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_app/core/errors/failures.dart';
import 'package:flutter_social_media_app/features/change_language/presentation/bloc/selected_language_bloc.dart';
import 'package:flutter_social_media_app/features/change_language/presentation/bloc/selected_language_events.dart';
import '../../../user_posts/presentation/pages/user_posts_page.dart';
import '../bloc/user_list_event.dart';
import '../bloc/user_list_state.dart';
import '../widgets/empty_user_list_widget.dart';
import '../widgets/loading_user_list_widget.dart';
import '../widgets/user_list_widget.dart';
import '../bloc/user_list_bloc.dart';
import '../../../../injection_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)?.usersPageTitle ?? '',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.translate,
            ),
            onPressed: () {
              context
                  .read<SelectedLanguageBloc>()
                  .add(ChangeSelectedLanguageEvent());
            },
          ),
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return serviceLocator<UserListBloc>()
          ..add(GetUserListsWithPostsNumberEvent());
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<UserListBloc, UserListState>(
            builder: (_, state) {
              if (state is Empty) {
                return MessageWidget(
                  message:
                      AppLocalizations.of(context)?.emptyUsersListMsg ?? '',
                );
              } else if (state is Loading) {
                return const LoadingUserListWidget();
              } else if (state is Error) {
                return MessageWidget(
                  message: _getFailureMessage(state.failure, context),
                );
              } else if (state is Loaded) {
                return UserListWidget(
                  usersWithPostsModel: state.userWithPostsModel,
                  onItemClicked: (selectedUser) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserPostsPage(
                            userWithPostsModel: selectedUser,
                          ),
                        ),
                      );
                    });
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  _getFailureMessage(Failure failure, BuildContext context) {
    if (failure is NetworkFailure) {
      return AppLocalizations.of(context)?.noInternetMsg ?? '';
    }
    return AppLocalizations.of(context)?.serverDownMsg ?? '';
  }
}
