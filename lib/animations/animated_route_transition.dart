// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CustomCupertinoPageRoute<T> extends CupertinoPageRoute<T> {
//   CustomCupertinoPageRoute({
//     required WidgetBuilder builder,
//     RouteSettings? settings,
//     bool fullscreenDialog = false,
//   }) : super(
//             builder: builder,
//             settings: settings,
//             fullscreenDialog: fullscreenDialog);

//   @override
//   Widget buildPage(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation) {
//     return CupertinoPageTransition(
//       primaryRouteAnimation: animation,
//       secondaryRouteAnimation: secondaryAnimation,
//       linearTransition: true, // This makes the animation linear.
//       child: builder(context),
//     );
//   }

//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     // Modify the offset tweens to achieve left-to-right animation.
//     final Animatable<Offset> customTween = Tween<Offset>(
//       begin: const Offset(-1.0, 0.0),
//       end: Offset.zero,
//     );

//     final Animation<Offset> customAnimation = animation.drive(customTween);

//     return SlideTransition(position: customAnimation, child: child);
//   }
// }
