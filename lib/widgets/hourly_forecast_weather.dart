import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app_10_10_22/controller/home_ctrl.dart';
import 'package:wether_app_10_10_22/models/weather/weather.dart';
import 'package:wether_app_10_10_22/models/weather_data_hourly.dart';

class HourlyForecastWeather extends GetView {
  final homeCtrl = Get.put<HomeController>(HomeController());
  final WeatherDataHourly? weatherDataHourly;
  final Weather? header;

  HourlyForecastWeather(
      {Key? key, required this.weatherDataHourly, required this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    //final height = MediaQuery.of(context).size.height;
    //final blockSizeWidth = width / 100;
    //final blockSizeHeight = height / 100;
    final blockSize = width / 100 + width / 100;
    //final double fontSize = blockSizeWidth;
    return Container(
      margin: EdgeInsets.all(blockSize * 1),
      decoration: const BoxDecoration(
        //color: Color(0xFF006092),
        gradient: LinearGradient(
          colors: [
            Color(0xFF74BDE0),
            Color(0xFF95B3CA),
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      height: blockSize * 14,
      child: ListView.builder(
        shrinkWrap: true,
        /// add physics to avoid Failed assertion: 'notification.metrics.axis == widget.axis': is not true.
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly!.hourly!.length > 48
            ? 48
            : weatherDataHourly!.hourly!.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: EdgeInsets.all(blockSize * 0.66),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  homeCtrl.getTime(weatherDataHourly!.hourly![index].dt!,
                      header?.timezoneOffset),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),

                // Image.network(
                //     'https://openweathermap.org/img/wn/${weatherDataHourly!.hourly![index].subWeather![0].icon}.png'),
                Image.asset(
                  "assets/weather/${weatherDataHourly!.hourly![index].subWeather![0].icon}.png",
                  scale: 3.5,
                ),
                Text(
                  '${weatherDataHourly!.hourly![index].temp!.toInt()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
