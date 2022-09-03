import 'package:flutter/material.dart';
import 'post_text_widget.dart';

class UserPostsListItemWidget extends StatelessWidget {
  final String title;
  final String body;

  const UserPostsListItemWidget({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListTile(
            title: PostTextWidget(
              text: title,
            ),
            subtitle: PostTextWidget(
              text: body,
            ),
          ),
        ),
      ),
    );
  }
}
