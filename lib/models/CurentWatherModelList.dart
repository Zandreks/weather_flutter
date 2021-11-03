class CurentWatherModelList {
  String cod;
  var message;
  City city;
  var cnt;
  var list =[];

  CurentWatherModelList(
      {this.cod, this.message, this.city, this.cnt, this.list});

  CurentWatherModelList.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    cnt = json['cnt'];
    if (json['list'] != null) {
      
      json['list'].forEach((v) {
        list.add(new List.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['message'] = this.message;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['cnt'] = this.cnt;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  var geonameId;
  String name;
  var lat;
  var lon;
  String country;
  String iso2;
  String type;
  var population;

  City(
      {this.geonameId,
      this.name,
      this.lat,
      this.lon,
      this.country,
      this.iso2,
      this.type,
      this.population});

  City.fromJson(Map<String, dynamic> json) {
    geonameId = json['geoname_id'];
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    iso2 = json['iso2'];
    type = json['type'];
    population = json['population'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geoname_id'] = this.geonameId;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['country'] = this.country;
    data['iso2'] = this.iso2;
    data['type'] = this.type;
    data['population'] = this.population;
    return data;
  }
}

class List {
  var dt;
  Temp temp;
  double pressure;
  var humidity;
  var weather = [];
  var speed;
  var deg;
  var clouds;
  var snow;

  List(
      {this.dt,
      this.temp,
      this.pressure,
      this.humidity,
      this.weather,
      this.speed,
      this.deg,
      this.clouds,
      this.snow});

  List.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weather.add(new WeatherList.fromJson(v));
      });
    }
    speed = json['speed'];
    deg = json['deg'];
    clouds = json['clouds'];
    snow = json['snow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    if (this.temp != null) {
      data['temp'] = this.temp.toJson();
    }
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    data['clouds'] = this.clouds;
    data['snow'] = this.snow;
    return data;
  }
}

class Temp {
  var day;
  var min;
  var max;
  var night;
  var eve;
  var morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}

class WeatherList {
  var id;
  String main;
  String description;
  String icon;

  WeatherList({this.id, this.main, this.description, this.icon});

  WeatherList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}
