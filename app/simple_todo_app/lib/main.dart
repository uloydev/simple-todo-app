import 'package:flutter/material.dart';
import 'package:simple_todo_app/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      title: 'Simple TODO App',
      home: LoginScreen(),
      color: Colors.blueGrey,
    );
  }
}
