import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  CityPage({Key key}) : super(key: key);

  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  onSubmitted: (value) {
                     Navigator.pop(context, cityName);
                  },
                  cursorColor: Colors.blueGrey[800],
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Enter city name",
                  ),
                  onChanged: (val) {
                    cityName = val;
                  },
                ),
              ),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get the weather',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
