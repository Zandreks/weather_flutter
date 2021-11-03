import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  SearchBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: Row(
        children: [
          Icon(Icons.search, size: 25,color: Colors.white,),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text("Enter search name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
            ) ,
          ),
        ],
      ),
    );
  }
}