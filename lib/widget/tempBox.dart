import 'package:flutter/material.dart';
class TempBox extends StatelessWidget {
  final main;
  final wind;
  TempBox({Key key, this.main, this.wind}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                child: Icon(
                  Icons.thermostat_sharp,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              Container(
                child: Text(
                  "${(main.pressure * 0.75062).round()} mm hg",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Container(
                child: Text(
                  "Pressure",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Icon(
                  Icons.opacity,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              Container(
                child: Text(
                  "${main.humidity} %",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Container(
                child: Text(
                  "Humidity",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Icon(
                  Icons.swap_horiz,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              Container(
                child: Text(
                  "$wind m/s",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Container(
                child: Text(
                  "Wind",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
