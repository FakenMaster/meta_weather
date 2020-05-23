import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:meta_weather/model/location.dart';

class Http {
  static Http _instance;
  Http._internal();

  final BaseUrl = "https://www.metaweather.com";

  factory Http.getInstance() => _getInstance();
  static _getInstance() {
    if (_instance == null) {
      _instance = Http._internal();
    }
    return _instance;
  }

  Future<List<Location>> searchLocationByName(String name) async {
    try {
      var response =
          await http.get(BaseUrl + "/api/location/search/?query=$name");
      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body);
        print("类型:${json.runtimeType},数据:$json");
        List<Location> result = (json as List)
            .map((location) => Location.fromJson(location))
            .toList();
        return result;
      }
      return null;
    } catch (err) {
      print("错误:$err");
      return null;
    }
  }

  Future<Location> getWeather(int woeid) async {
    try {
      var response = await http.get(BaseUrl + "/api/location/$woeid");
      if (response.statusCode == 200) {
        Location location =
            Location.fromJson(convert.jsonDecode(response.body));
        print("详情:${location.toJson()}");
        return location;
      }
      return null;
    } catch (err) {
      print("错误$err");
      return null;
    }
  }
}
