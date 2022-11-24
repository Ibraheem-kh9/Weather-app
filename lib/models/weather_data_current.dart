import 'package:wether_app_10_10_22/models/weather/current.dart';

class WeatherDataCurrent{
  Current? current;

  WeatherDataCurrent({this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherDataCurrent(
      current: Current.fromJson(json["current"]),
    );
  }
//

}