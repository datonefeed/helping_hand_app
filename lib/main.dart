import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/AcountPage/login.dart';
import 'package:login/Contact/ContactPage.dart';
import 'package:login/Navigation/App_Navigation.dart';
import 'Home/HomePage.dart';
import 'ActivePage/EditProfilePage.dart';
import 'Profile/ProfilePage.dart';
import 'Contact/ContactPage.dart';
import 'ActivePage/Main_Wrapper.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigation.router,
    );
  }
}