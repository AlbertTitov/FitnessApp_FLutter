import 'package:flutter/material.dart';
import 'package:mi_card/screens/auth.dart';
import 'screens/home.dart';

void main() {
  runApp(HerakApp());
}

class HerakApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitnessApp',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(title: TextStyle(color: Colors.white))),
      home: AuthorizationPage(),
    );
  }
}
