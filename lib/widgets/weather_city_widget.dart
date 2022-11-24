import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app_10_10_22/controller/home_ctrl.dart';
import 'package:wether_app_10_10_22/models/weather/weather.dart';
import 'package:wether_app_10_10_22/models/weather_data_current.dart';
import 'package:wether_app_10_10_22/utils/responsive_size.dart';

class WeatherCity extends StatelessWidget {
  //WeatherDataHeader? weatherHeader;
  final homeCtrl = Get.put<HomeController>(HomeController());
  final WeatherDataCurrent? weatherDataCurrent;
  final Weather? header;

  WeatherCity({
    Key? key,
    this.header,
    this.weatherDataCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final blockSizeWidth = width / 100;
    final blockSizeHeight = height / 100;
    final blockSize = width / 100 + width / 100;
    final double fontSize = blockSizeWidth;
    SizeConfig().init(context);
    return Container(
      //margin: EdgeInsets.only(bottom: elementWidth * 5),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF74BDE0),
              Color(0xFF95B3CA),
            ],
          ),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(100.0),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF3B8AC3).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 10),
              blurStyle: BlurStyle.values[1],
            ),
            BoxShadow(
              color: const Color(0xFFF4D096),
              //color: Color(0xFF74BDE0).withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 5,
              offset: const Offset(0, 5),
              blurStyle: BlurStyle.values[1],
            )
          ]),
      width: double.infinity,
      height: blockSize * 27,
      child: Padding(
        padding: EdgeInsets.only(top: blockSizeHeight * 0.5),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  header!.timezone!.split('/').removeAt(1).replaceAll('_', ' '),
                  style: TextStyle(
                    fontSize: fontSize * 9.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: blockSizeHeight * 0.3,
                ),
                Text(
                  homeCtrl.date,
                  style: TextStyle(
                    fontSize: fontSize * 4.0,
                    color: Colors.grey[300],
                  ),
                ),
                // Image.asset(
                //     "assets/weather_icon/day/${weatherDataCurrent!.current!.subWeather![0].id}.png",
                // scale: 0.5,)
                //LottieBuilder.asset(Images.rain,width: 150.0,),
                Image.asset(
                  "assets/weather/${weatherDataCurrent!.current!.subWeather![0].icon}.png",
                  width: fontSize * 15.0,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${weatherDataCurrent!.current!.temp?.truncate()}°',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize * 12.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${weatherDataCurrent!.current!.subWeather![0].main}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize * 5.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
