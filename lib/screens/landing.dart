import 'package:flutter/material.dart';
import 'package:fitness_app/screens/auth.dart';
import 'package:fitness_app/screens/home.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bool isLoggedIn = false;

    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
