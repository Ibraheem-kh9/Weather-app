import 'dart:convert';

import 'package:wether_app_10_10_22/models/weather/current.dart';
import 'package:wether_app_10_10_22/models/weather/daily.dart';
import 'package:wether_app_10_10_22/models/weather/hourly.dart';

class Weather{
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  Weather({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.hourly,
    this.daily,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      lat: (json['lat'])?.toDouble(),
      lon: (json['lon'])?.toDouble(),
      timezone: json['timezone'] ,
      timezoneOffset: json['timezone_offset'],
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      hourly: (json['hourly'] as List<dynamic>?)
          ?.map((e) => Hourly.fromJson(e as Map<String, dynamic>))
          .toList(),
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => Daily.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "lat": lat,
      "lon": lon,
      "timezone": timezone,
      "timezone_offset": timezoneOffset,
      "current": current,
      "hourly": jsonEncode(hourly),
      "daily": jsonEncode(daily),
    };
  }
//

}