import 'package:flutter/material.dart';
import 'package:Weather/constans/constans.dart';

class TodayWeather extends StatelessWidget {
  final weather;
  final temp;

  TodayWeather({Key key, this.weather, this.temp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Image.network(
            "${Constans.urlIcon}${weather.icon}.png",
            scale: 0.6,
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "$temp °С",
                  style: TextStyle(
                    fontSize: 49,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 0),
                child: Text(
                  "${weather.description}".toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
