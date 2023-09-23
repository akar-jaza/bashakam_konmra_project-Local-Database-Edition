import 'package:flutter/material.dart';
import '../constantes/them_colors.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppBar(
        backgroundColor: ThemeColors.kBodyColor,
        surfaceTintColor: ThemeColors.kBodyColor,
        title: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: ThemeColors.kBodyTextColor,
              fontFamily: 'rabarBold',
            ),
          ),
        ),
      ),
      // Platform.isIOS
      //     ? const Text(
      //         'بەشەکەم \u{1F393}',
      //         style: TextStyle(
      //           fontSize: 18,
      //           color: ThemeColors.kBodyTextColor,
      //           fontFamily: 'rabarBold',
      //         ),
      //       )
      //     : const Center(
      //    Text(
      //     'بەشەکەم \u{1F393}',
      //     style: TextStyle(
      //       fontSize: 18,
      //       color: ThemeColors.kBodyTextColor,
      //       fontFamily: 'rabarBold',
      //     ),
      //   ),
      // ),
      // leading: Builder(
      //   builder: (BuildContext context) {
      //     return Theme(
      //       data: ThemeData(
      //         splashColor: Platform.isIOS ? Colors.transparent : null,
      //         highlightColor: Platform.isIOS ? Colors.transparent : null,
      //       ),
      //       child: IconButton(
      //         color: Colors.white,
      //         icon: const Icon(
      //           Icons.menu_outlined,
      //           size: 20,
      //         ),
      //         onPressed: () {
      //           Scaffold.of(context).openDrawer();
      //         },
      //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //       ),
      //     );
      //   },
      // ),
      // actions: const [
      //   Padding(
      //     padding: EdgeInsets.only(left: 25),
      //     child: Text(
      //       'بەشەکەم',
      //       style: TextStyle(
      //         fontSize: 18,
      //         color: ThemeColors.kWhiteTextColor,
      //         fontFamily: 'rabarBold',
      //       ),
      //     ),
    );
    //     ],
    //   ),
    // );
  }
}
