

import 'package:wether_app_10_10_22/utils/api_key.dart';

String apiURL(var lat, var lon) {
  String url;

  url =
  "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$apiKey&unit=metric";

  return url;
}
