import 'package:flutter/material.dart';
import 'package:Weather/models/CurentWatherModelList.dart';
import 'package:intl/intl.dart';
import 'package:Weather/constans/constans.dart';

class ListBox extends StatelessWidget {
  Future<CurentWatherModelList> listday;
  ListBox({Key key, this.listday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dateFormat(dt) {
      DateTime now = DateTime.fromMillisecondsSinceEpoch(dt * 1000);

      DateFormat formatter = DateFormat('EEEE');
      return formatter.format(now).toString();
    }

    return FutureBuilder(
        future: listday,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            CurentWatherModelList data = snapshot.data;
            return Container(
              margin: EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 130,
                child: ListView.builder(
                  itemCount: data.list.length,

                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(color: Colors.white30),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              dateFormat(data.list[index].dt),
                              style:
                                  TextStyle(fontSize: 19, color: Colors.white),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    "${(data.list[index].temp.day - 273.15).round().toString()}°С",
                                    style: TextStyle(
                                        fontSize: 35, color: Colors.white),
                                  ),
                                ),
                                Image.network(
                                  "${Constans.urlIcon}${data.list[index].weather[0].icon}.png",
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Text(
                                "${data.list[index].weather[0].description}",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.white)),
                          )
                        ],
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemExtent: 220,
                  // shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          }
        });
  }
}
