import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportster/ui/homeScreen/homeScreen.dart';
import 'package:sportster/ui/loginScreen/login.dart';
import 'package:sportster/ui/registerScreen/register.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
    ),
  );
}
