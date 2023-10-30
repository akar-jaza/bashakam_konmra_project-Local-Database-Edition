// ignore_for_file: slash_for_doc_comments
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoListSection extends StatelessWidget {
  const MyCupertinoListSection({
    super.key,
    required this.headerText,
    required this.tiles,
  });

  final String headerText;

  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      backgroundColor: Theme.of(context).colorScheme.background,
      header: Text(
        headerText,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
            fontWeight: FontWeight.w100,
            fontSize: 15),
      ),
      children: [
        ...tiles,
      ],
    );
  }
}

class MyCupertinoListTile extends StatelessWidget {
  const MyCupertinoListTile({
    super.key,
    required this.titleText,
    this.leadingIcon,
    required this.onTap,
    required this.trailing,
  });

  final String titleText;
  final IconData? leadingIcon;
  final Function() onTap;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(
        titleText,
        style: TextStyle(
          fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
          fontSize: 15,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      leading: Icon(
        leadingIcon,
        size: 22,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
