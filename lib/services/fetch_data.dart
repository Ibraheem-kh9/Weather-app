import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wether_app_10_10_22/models/weather/weather.dart';
import 'package:wether_app_10_10_22/models/weather_data_daily.dart';
import 'package:wether_app_10_10_22/models/weather_data.dart';
import 'package:wether_app_10_10_22/models/weather_data_current.dart';
import 'package:wether_app_10_10_22/models/weather_data_hourly.dart';
import 'package:wether_app_10_10_22/services/api_key.dart';

class FetchDataAPI {
  WeatherData? weatherData;

  Future<WeatherData> getLocationData(lat, long) async {
    ///37.42342342342342
    ///-122.08395287867832
    var jsonData = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&exclude=minutely&appid=$apiKey&units=metric'));
    var result = jsonDecode(jsonData.body);
    weatherData = WeatherData(
      header: Weather.fromJson(result),
      current: WeatherDataCurrent.fromJson(result),
      hourly: WeatherDataHourly.fromJson(result),
      daily: WeatherDataDaily.fromJson(result),
    );
    return weatherData!;
  }
}
