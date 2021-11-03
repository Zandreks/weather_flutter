import 'package:flutter/material.dart';
import 'package:Weather/api/weather.dart';
import 'package:Weather/models/CurentWatherModel.dart';
import 'package:Weather/models/CurentWatherModelList.dart';
import 'package:Weather/page/CityPage.dart';
import 'package:Weather/widget/ListBox.dart';
import 'package:Weather/widget/ListWeather.dart';
import 'package:Weather/widget/nameSity.dart';
import 'package:Weather/widget/tempBox.dart';
import 'package:Weather/widget/todayWather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<CurentWatherModel> data;
  Future<CurentWatherModelList> data2;
  String city = 'London';
  var lat;
  var lon;
  var load = false;

  Future<void> getlocation(st) async {
    try {
      setState(() {
        load = true;
      });
      var geolocator = Geolocator();
      var status = await geolocator.checkGeolocationPermissionStatus();
      if (status.value == 0) {
        Fluttertoast.showToast(
            msg: "You have geolocation enabled",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          data = WeatherApi().getDataCity(city: this.city);
          data2 = WeatherApi().getDataCityList(city: this.city);
          load = false;
        });
        return false;
      }
      Position position;
      if(st==false){
        position = await geolocator.getLastKnownPosition(
          desiredAccuracy: LocationAccuracy.low);
      }
      
      if (position == null || st ==true) {
        position = await geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
      }

      setState(() {
        lon = position.longitude;
        lat = position.latitude;
        load = false;
        data = WeatherApi()
            .getDataGps(lat: position.latitude, lon: position.longitude);
        data2 = WeatherApi()
            .getDataGpsList(lat: position.latitude, lon: position.longitude);
      });
    } catch (e) {
      throw ("error ge location$e");
    }
  }

  @override
  void initState() {
    super.initState();
    getlocation(false);
    setState(() {
      // data = WeatherApi().getDataCity(city: city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[400],
      appBar: AppBar(
        title: Text("Weather"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              getlocation(true);
            }),
        actions: [
          IconButton(
              icon: Icon(Icons.location_city),
              onPressed: () async {
                setState(() {
                  load = true;
                });
                var val = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return CityPage();
                }));

                if (val != null) {
                  city = val;
                  setState(() {
                    load = false;

                    data = WeatherApi().getDataCity(city: val);
                    data2 = WeatherApi().getDataCityList(city: val);
                  });
                } else {
                  setState(() {
                    load = false;
                  });
                }
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: data,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && load != true) {
              CurentWatherModel data = snapshot.data;
              return ListView(
                children: [
                  NameSity(
                    name: data.name,
                    dt: data.dt,
                    country: data.sys.country,
                  ),
                  TodayWeather(
                    weather: data.weather[0],
                    temp: data.main.temp,
                  ),
                  TempBox(
                    main: data.main,
                    wind: data.wind.speed,
                  ),
                  TitleWather(),
                  ListBox(
                    listday: data2,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Сould not find the city try again",
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
