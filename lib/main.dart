import 'package:flutter/material.dart';
import 'package:rocketman/screens/home_screen.dart';
import 'package:rocketman/screens/next_launch_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return buildError(context, errorDetails);
        };
        return widget;
      },
      debugShowCheckedModeBanner: false,
      //Add background
      home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bg.jpg"), fit: BoxFit.cover)),
          child: Home()),
    );
  }
}
//General Exception for whole App
Widget buildError(BuildContext context, FlutterErrorDetails error) {
  return Scaffold(
    body: Center(
      child: Text(
        "sorry, something wrong happened",textAlign: TextAlign.center,
      ),
    ),
  );
}