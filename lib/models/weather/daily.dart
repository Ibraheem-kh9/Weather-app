import 'dart:convert';

import 'package:wether_app_10_10_22/models/weather/feels_like.dart';
import 'package:wether_app_10_10_22/models/weather/sub_weather.dart';
import 'package:wether_app_10_10_22/models/weather/temp.dart';

class Daily{
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<SubWeather>? subWeather;
  int? clouds;
  double? pop;
  double? uvi;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.subWeather,
    this.clouds,
    this.pop,
    this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      dt: json['dt'] as int?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
      moonrise: json['moonrise'] as int?,
      moonset: json['moonset'] as int?,
      moonPhase: (json['moon_phase'] as num?)?.toDouble(),
      temp: json['temp'] == null
          ? null
          : Temp.fromJson(json['temp'] as Map<String, dynamic>),
      feelsLike: json['feels_like'] == null
          ? null
          : FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
      dewPoint: (json['dew_point'] as num?)?.toDouble(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      windDeg: json['wind_deg'] as int?,
      windGust: (json['wind_gust'] as num?)?.toDouble(),
      subWeather: (json['weather'] as List<dynamic>?)
          ?.map((e) => SubWeather.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: json['clouds'] as int?,
      pop: (json['pop'] as num?)?.toDouble(),
      uvi: (json['uvi'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "dt": dt,
      "sunrise": sunrise,
      "sunset": sunset,
      "moonrise": moonrise,
      "moonset": moonset,
      "moon_phase": moonPhase,
      "temp": temp,
      "feels_like": feelsLike,
      "pressure": pressure,
      "humidity": humidity,
      "dew_point": dewPoint,
      "wind_speed": windSpeed,
      "wind_deg": windDeg,
      "wind_gust": windGust,
      "subWeather": jsonEncode(subWeather),
      "clouds": clouds,
      "pop": pop,
      "uvi": uvi,
    };
  }
//

}