import 'package:fitness_app/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/screens/auth.dart';
import 'package:fitness_app/screens/home.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
