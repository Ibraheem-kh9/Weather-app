// class WeatherDataMain {
//   Timezone? zone;
//
//   WeatherDataMain({this.zone});
//
//   factory WeatherDataMain.fromJson(Map<String, dynamic> json) {
//     return WeatherDataMain(
//       zone: Timezone.fromJson(json['timezone']),
//     );
//   }
// //
//
// }
//
// class Timezone {
//   String? timezone;
//   double? lat;
//   // List<Current>? current;
//   // List<Hourly>? hourly;
//   // List<Daily>? daily;
//
//   Timezone({
//     this.timezone,
//     this.lat,
//     /*this.current, this.hourly, this.daily*/
//   });
//
//   factory Timezone.fromJson(Map<String, dynamic> json) {
//     return Timezone(
//       timezone: json['timezone'] as String?,
//       lat: json['lat'] as double?,
//       /*current: List.of(json['current']).map((e) => Current.fromJson(e)).toList(),
//     hourly: List.of(json['hourly']).map((e) => Hourly.fromJson(e)).toList(),
//     daily: List.of(json['daily']).map((e) => Daily.fromJson(e)).toList(),*/
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'timezone': timezone,
// /*    'current'  : jsonEncode(current),
//     'hourly'   : jsonEncode(hourly),
//     'daily'    : jsonEncode(daily),*/
//     };
//   }
//
// //
//
// }
