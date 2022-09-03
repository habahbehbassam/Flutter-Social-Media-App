import 'package:flutter/material.dart';

class CollapsingAppbarWidget extends StatelessWidget {
  final Image backgroundImage;
  final String title;

  const CollapsingAppbarWidget({
    Key? key,
    required this.backgroundImage,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height / 3,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(title),
        background: backgroundImage,
      ),
    );
  }
}
