import 'package:wether_app_10_10_22/models/weather/daily.dart';

class WeatherDataDaily{
  List<Daily>? daily;

  WeatherDataDaily({this.daily});

  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) {
    return WeatherDataDaily(
      daily: List<Daily>.from(json["daily"].map((e) => Daily.fromJson(e) )),);
  }
//

}