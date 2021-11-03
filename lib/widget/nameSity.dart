import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NameSity extends StatefulWidget {
  final name;
  final dt;
  final country;
  NameSity({Key key, this.name, this.dt, this.country}) : super(key: key);

  @override
  _NameSityState createState() => _NameSityState();
}

class _NameSityState extends State<NameSity> {
  String curentDate;
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.fromMillisecondsSinceEpoch(widget.dt * 1000);

    DateFormat formatter = DateFormat('EEE MMM dd yyyy');
    setState(() {
      curentDate = formatter.format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3),
      child: Column(
        children: [
          Container(
            child: Text(
              "${widget.name} ${widget.country}",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Text(
              "$curentDate",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
