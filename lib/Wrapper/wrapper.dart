import 'package:flutter/material.dart';
import 'package:HelpingHand/AcountPage/auth.dart';
import 'package:HelpingHand/Navigation/App_Navigation.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    //return either authenticate or home
    if(user == null) {
      return const Authenticate();
    } else {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppNavigation.router,
      );
    }
  }
}
