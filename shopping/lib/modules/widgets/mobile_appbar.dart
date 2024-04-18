import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:shopping/utility/routes/app_routes.dart';
import 'package:ico/ico.dart';

class MobileSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  const MobileSearchAppBar({super.key, this.bottom});

  @override
  Widget build(BuildContext context) {
    var data = 'Search Product..';
    return AppBar(
      titleSpacing: 8,
      toolbarHeight: 64,
      title: buildSearchField(context, data),
      bottom: bottom,
      actions: [
        SizedBox.square(
            dimension: 48,
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(Ico.notification_outline),
            ))
      ],
    );
  }

  OutlinedButton buildSearchField(BuildContext context, String data) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: context.theme.disabledColor,
        side: BorderSide.none,
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        elevation: 16,
        backgroundColor: context.theme.canvasColor,
        fixedSize: const Size.fromHeight(48),
      ),
      onPressed: () => AppRoutes.SearchKeywordScreen.pushNamed(),
      child: Row(
        children: [
          const Icon(Ico.search_outline).paddingAll(4),
          const VerticalDivider(endIndent: 8, indent: 8),
          Text(data),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48 + 16 + (bottom?.preferredSize.height ?? 0));
}
