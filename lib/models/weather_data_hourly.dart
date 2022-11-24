import 'package:wether_app_10_10_22/models/weather/hourly.dart';

class WeatherDataHourly{
  List<Hourly>? hourly;

  WeatherDataHourly({this.hourly});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) {
    return WeatherDataHourly(
      hourly: List<Hourly>.from(json['hourly'].map((e) => Hourly.fromJson(e))),
    );
  }
//

}