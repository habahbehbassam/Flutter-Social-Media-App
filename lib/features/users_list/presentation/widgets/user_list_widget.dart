import 'package:flutter/material.dart';
import '../../data/models/user_with_posts_model.dart';
import 'user_list_item_widget.dart';

class UserListWidget extends StatelessWidget {
  final List<UserWithPostsModel> usersWithPostsModel;
  final Function (UserWithPostsModel selectedUser) onItemClicked;

  const UserListWidget({
    Key? key,
    required this.usersWithPostsModel,
    required this.onItemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usersWithPostsModel.length,
      itemBuilder: (context, index) {
        return UserListItemWidget(
          userName: usersWithPostsModel[index].user.name,
          userImageUrl: usersWithPostsModel[index].user.url,
          postsCount: usersWithPostsModel[index].posts.length,
          onItemClicked:(){
            final selectedUser = usersWithPostsModel[index];
            onItemClicked(selectedUser);
          },
        );
      },
    );
  }
}
