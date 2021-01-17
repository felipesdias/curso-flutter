import 'package:flutter/material.dart';

import '../pages/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color.fromRGBO(136, 14, 79, 1);
    final primaryDark = Color.fromRGBO(96, 0, 39, 1);
    final primaryLight = Color.fromRGBO(188, 71, 123, 1);

    return MaterialApp(
      title: '4Dev',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
          primaryColor: primaryColor,
          primaryColorDark: primaryDark,
          primaryColorLight: primaryLight,
          accentColor: primaryColor,
          backgroundColor: Colors.white,
          textTheme: TextTheme(headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: primaryDark)),
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryLight)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor))),
          buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.light(primary: primaryColor),
              buttonColor: primaryColor,
              splashColor: primaryLight,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
    );
  }
}
