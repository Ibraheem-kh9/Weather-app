import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app_10_10_22/controller/home_ctrl.dart';
import 'package:wether_app_10_10_22/models/weather_data_daily.dart';

class DailyForecast7Days extends GetView {
  final homeCtrl = Get.put<HomeController>(HomeController());
  final WeatherDataDaily? weatherDataDaily;

  DailyForecast7Days({Key? key, required this.weatherDataDaily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final blockSizeWidth = width / 100;
    final blockSizeHeight = height / 100;
    final blockSize = width / 100 + width / 100;
    //final double fontSize = blockSizeWidth;
    return Container(
      margin: EdgeInsets.all(blockSize * 1.0),
      decoration: const BoxDecoration(
        //color: Color(0xFF006092),
        gradient: LinearGradient(colors: [
          Color(0xFF74BDE0),
          Color(0xFF95B3CA),
        ]),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      height: blockSizeHeight * 34.5,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: weatherDataDaily!.daily!.length > 7
            ? 7
            : weatherDataDaily!.daily!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: blockSizeHeight * 0.8,
              bottom: blockSizeHeight * 0.8,
              left: 20.0,
              right: 10.0,
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        homeCtrl.getDate(weatherDataDaily!.daily![index].dt),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Image.asset(
                        "assets/weather/${weatherDataDaily!.daily![index].subWeather![0].icon}.png",
                        scale: 3.5,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image.network(
                      //     'https://openweathermap.org/img/wn/${weatherDataDaily!.daily![index].subWeather![0].icon}.png'),
                      // Image.asset(
                      //   "assets/weather/${weatherDataDaily!.daily![index].subWeather![0].icon}.png",
                      //   scale: 3.5,
                      // ),

                      Text(
                        '${weatherDataDaily!.daily![index].temp!.min!.toInt()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(
                        width: blockSizeWidth * 7.0,
                      ),
                      Text(
                        '${weatherDataDaily!.daily![index].temp!.max!.toInt()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
