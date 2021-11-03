import 'dart:convert';

import 'package:Weather/constans/constans.dart';
import 'package:Weather/models/CurentWatherModel.dart';
import 'package:http/http.dart' as http;
import 'package:Weather/models/CurentWatherModelList.dart';

class WeatherApi {
  Future<CurentWatherModel> getDataCity({String city}) async {
    var queryParan = {"APPID": Constans.AppKey, "units": "metric", "q": city};
    var url = Uri.https(Constans.domain, Constans.baseUrlCurent, queryParan);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      return CurentWatherModel.fromJson(json.decode(res.body));
    } else {
      throw Exception('error res');
    }
  }

  Future<CurentWatherModel> getDataGps({lat, lon}) async {
    var queryParan = {
      "APPID": Constans.AppKey,
      "units": "metric",
      "lat": lat.toString(),
      "lon": lon.toString()
    };
    var url = Uri.https(Constans.domain, Constans.baseUrlCurent, queryParan);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      return CurentWatherModel.fromJson(json.decode(res.body));
    } else {
      throw Exception('error res');
    }
  }

  Future<CurentWatherModelList> getDataCityList({String city}) async {
    // var queryParan = {"APPID": Constans.AppKey2, "units": "metric", "q": city};
    // var url = Uri.https(Constans.domain2, Constans.baseUrlCurent2, queryParan);
    var url =
        "https://samples.openweathermap.org/data/2.5/forecast/daily?id=524901&appid=b1b15e88fa797225412429c1c50c122a1";

    var res = await http.get(url);
    if (res.statusCode == 200) {
      return CurentWatherModelList.fromJson(json.decode(res.body));
    } else {
      throw Exception('error res');
    }
  }

  Future<CurentWatherModelList> getDataGpsList({lat, lon}) async {
    // var queryParan = {
    //   "APPID": Constans.AppKey2,
    //   "units": "metric",
    //   "lat": lat.toString(),
    //   "lon": lon.toString()
    // };
    // var url = Uri.https(Constans.domain2, Constans.baseUrlCurent2, queryParan);
    var url =
        "https://samples.openweathermap.org/data/2.5/forecast/daily?id=524901&appid=b1b15e88fa797225412429c1c50c122a1";
    var res = await http.get(url);
    if (res.statusCode == 200) {
      return CurentWatherModelList.fromJson(json.decode(res.body));
    } else {
      throw Exception('error res');
    }
  }
}
