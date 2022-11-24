import 'package:wether_app_10_10_22/models/weather/weather.dart';
import 'package:wether_app_10_10_22/models/weather_data_daily.dart';
import 'package:wether_app_10_10_22/models/weather_data_current.dart';
import 'package:wether_app_10_10_22/models/weather_data_hourly.dart';

class WeatherData{
  Weather? header;
  WeatherDataCurrent? current;
  WeatherDataHourly? hourly;
  WeatherDataDaily? daily;

  WeatherData({this.header , this.current, this.hourly, this.daily});

  Weather? weatherHeader() => header;
  WeatherDataCurrent? weatherDataCurrent() => current;
  WeatherDataHourly? weatherDataHourly() => hourly!;
  WeatherDataDaily? weatherDataDaily() => daily!;

}