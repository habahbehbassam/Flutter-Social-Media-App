import 'package:flutter/cupertino.dart';

class MessageWidget extends StatelessWidget {
  final String message;

  const MessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
