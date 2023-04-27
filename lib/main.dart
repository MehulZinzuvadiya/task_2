import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_2/Provider/todo_provider.dart';
import 'package:task_2/View/home_screen.dart';
import 'package:task_2/View/login_screen.dart';
import 'package:task_2/View/sign_up.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TodoProvider(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginScreen(),
        'signUp': (context) => SignupScreen(),
        'home': (context) => HomeScreen(),
      },
    ),
  ));
}
