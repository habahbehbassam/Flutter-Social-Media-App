import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserListItemWidget extends StatelessWidget {
  final String userImageUrl;
  final String userName;
  final int postsCount;
  final Function  onItemClicked;

  const UserListItemWidget({
    Key? key,
    required this.userImageUrl,
    required this.userName,
    required this.postsCount,
    required this.onItemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userImageUrl),
            ),
            title: Text(userName),
            subtitle: Text('${AppLocalizations.of(context)?.postsCount} $postsCount'),
            onTap:() =>  onItemClicked(),
          ),
        ),
      ),
    );
  }
}
