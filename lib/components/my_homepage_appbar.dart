
import 'package:flutter/material.dart';
import '../constantes/them_colors.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColors.kBodyColor,
      title: const Center(
        child: Text(
          '🎓 بەشەکەم',
          style: TextStyle(
            fontSize: 18,
            color: ThemeColors.kWhiteTextColor,
            fontFamily: 'rabarBold',
          ),
        ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            color: Colors.white,
            icon: const Icon(
              Icons.menu_outlined,
              size: 18,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: IconButton(
            onPressed: () {},
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/images/flo.png',
              ),
            ),
          ),
          color: Colors.white,
        ),
      ],
    );
  }
}
