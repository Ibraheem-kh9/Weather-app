import 'package:wether_app_10_10_22/models/weather_data_current.dart';

class WeatherDataHourly{
  List<Hourly>? hourly;

  WeatherDataHourly({this.hourly});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) {
    return WeatherDataHourly(
      hourly: List.of(json["hourly"])
          .map((e) => Hourly.fromJson(e))
          .toList(),
    );
  }
//

}
class Hourly {
  int? dt;
  int? temp;
  List<Weather>? weather;

  Hourly({
    this.dt,
    this.temp,
    this.weather,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
    dt: json['dt'] as int?,
    temp: (json['temp'] as num?)?.round(),
    weather: (json['weather'] as List<dynamic>?)
        ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'dt': dt,
    'temp': temp,
    'weather': weather?.map((e) => e.toJson()).toList(),
  };
}