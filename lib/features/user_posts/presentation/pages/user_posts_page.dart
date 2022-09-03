import 'package:flutter/material.dart';
import '../../../users_list/data/models/user_with_posts_model.dart';
import '../widgets/collaping_app_bar_widget.dart';
import '../widgets/user_posts_list_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserPostsPage extends StatelessWidget {
  final UserWithPostsModel userWithPostsModel;

  const UserPostsPage({
    Key? key,
    required this.userWithPostsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          CollapsingAppbarWidget(
            title:
                '${userWithPostsModel.user.name} ${AppLocalizations.of(context)?.posts}',
            backgroundImage: Image.network(
              userWithPostsModel.user.thumbnailUrl,
              fit: BoxFit.cover,
            ),
          )
        ];
      },
      body: UserPostsListWidget(
        userWithPostsModel: userWithPostsModel,
      ),
    );
  }
}
