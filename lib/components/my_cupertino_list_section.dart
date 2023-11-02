// ignore_for_file: slash_for_doc_comments
import 'package:bashakam_barawzanko/Providers/font_provider.dart';
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
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
          fontWeight: FontWeight.w100,
          fontSize: 15,
        ),
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
    String getFont = FontProvider.defaultFont;

    return CupertinoListTile.notched(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(
        titleText,
        style: TextStyle(
          fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
          fontSize: getFont != "uniQaidar" ? 15 : 16,
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
