import 'package:flutter/material.dart';

class TitleWather extends StatelessWidget {
  TitleWather({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 30),
      child: Text(
        "Weather for 16 days",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
