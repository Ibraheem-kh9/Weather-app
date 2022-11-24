import 'dart:convert';

import 'package:wether_app_10_10_22/models/weather/sub_weather.dart';

class Hourly{
  int? dt;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<SubWeather>? subWeather;

  Hourly({
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.subWeather,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      dt: json['dt'] as int?,
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
      dewPoint: (json['dew_point'] as num?)?.toDouble(),
      uvi: (json['uvi'] as num?)?.toDouble(),
      clouds: json['clouds'] as int?,
      visibility: json['visibility'] as int?,
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      windDeg: json['wind_deg'] as int?,
      windGust: (json['wind_gust'] as num?)?.toDouble(),
      subWeather: (json['weather'] as List<dynamic>?)
          ?.map((e) => SubWeather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "dt": dt,
      "temp": temp,
      "feels_like": feelsLike,
      "pressure": pressure,
      "humidity": humidity,
      "dew_point": dewPoint,
      "uvi": uvi,
      "clouds": clouds,
      "visibility": visibility,
      "wind_speed": windSpeed,
      "wind_deg": windDeg,
      "wind_gust": windGust,
      "subWeather": jsonEncode(subWeather),
    };
  }
//



}