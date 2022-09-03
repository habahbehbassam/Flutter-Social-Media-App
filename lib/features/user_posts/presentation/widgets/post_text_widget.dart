import 'package:flutter/material.dart';

class PostTextWidget extends StatelessWidget {
  final String text;

  const PostTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
