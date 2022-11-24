
import 'package:wether_app_10_10_22/models/weather_data_current.dart';
import 'package:wether_app_10_10_22/models/weather_data_daily.dart';
import 'package:wether_app_10_10_22/models/weather_data_hourly.dart';
class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDataDaily getDailyWeather() => daily!;
}
