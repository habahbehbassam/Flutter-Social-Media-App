import 'package:flutter/material.dart';

import '../../../users_list/data/models/user_with_posts_model.dart';

class UserPostsListWidget extends StatelessWidget {
  final UserWithPostsModel userWithPostsModel;

  const UserPostsListWidget({
    Key? key,
    required this.userWithPostsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userWithPostsModel.posts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(1),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                title: Center(
                  child: Text(
                    userWithPostsModel.posts[index].title,
                    textAlign: TextAlign.center,
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    userWithPostsModel.posts[index].body,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
