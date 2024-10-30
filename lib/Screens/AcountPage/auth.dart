import 'package:flutter/material.dart';
import 'package:helping_hand_app/Screens/AcountPage/login.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
