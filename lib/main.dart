import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';
import 'quick_access.dart';

void main() => runApp(MyApp());

var check = false;

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    if(check){
      return MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff042375),
        ),
        debugShowCheckedModeBanner: false,
        home: Login(),
      );
    }
    else {
      return MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff042375),
        ),
        debugShowCheckedModeBanner: false,
        home: QuickAccess(),
      );
    }

  }
}
