import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'quick_access.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isFirst = true;

  Future<void> check_isFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isFirst = prefs.getBool("isFirst");
    if (isFirst != null) {
      setState(() {
        _isFirst = prefs.getBool("isFirst");
      });
    }

    print(_isFirst);
  }

  @override
  void initState() {
    check_isFirst();
    super.initState();
  }

  Widget build(BuildContext context) {
    if (_isFirst) {
      return MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff042375),
        ),
        debugShowCheckedModeBanner: false,
        home: Login(),
      );
    } else {
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
