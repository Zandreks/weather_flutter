import 'package:flutter/material.dart';
import 'package:Weather/page/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather',
        theme: ThemeData(primaryColor: Colors.deepOrange[400]),
        home: HomePage());
  }
}
