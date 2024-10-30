// import 'package:flutter/material.dart';
//
// class CustomPageRouteBuilder extends PageRouteBuilder {
//   final Widget Function(BuildContext) pageBuilder;
//
//   CustomPageRouteBuilder({
//     required this.pageBuilder,
//   }) : super(
//     pageBuilder: (
//         BuildContext context,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//         ) {
//       return pageBuilder(context);
//     },
//     transitionsBuilder: (
//         BuildContext context,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//         Widget child,
//         ) {
//       const begin = Offset(1.0, 0.0);
//       const end = Offset.zero;
//       const curve = Curves.easeInOutQuad;
//
//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//       var offsetAnimation = animation.drive(tween);
//
//       return SlideTransition(
//         position: offsetAnimation,
//         child: child,
//       );
//     },
//   );
// }
