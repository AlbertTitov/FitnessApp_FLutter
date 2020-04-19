import 'package:fitness_app/domain/user.dart';
import 'package:fitness_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/screens/landing.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(HerakApp());
}

class HerakApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().currentUser,
        child: MaterialApp(
      title: 'FitnessApp',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(title: TextStyle(color: Colors.white))),
      home: LandingPage(),
    ));
  }
}
