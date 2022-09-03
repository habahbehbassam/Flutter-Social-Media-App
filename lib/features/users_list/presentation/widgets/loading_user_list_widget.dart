import 'package:flutter/material.dart';

class LoadingUserListWidget extends StatelessWidget {
  const LoadingUserListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
