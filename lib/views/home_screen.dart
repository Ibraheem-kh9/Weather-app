import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app_10_10_22/controller/home_ctrl.dart';
import 'package:wether_app_10_10_22/models/weather_data.dart';
import 'package:wether_app_10_10_22/views/loading_page.dart';
import 'package:wether_app_10_10_22/widgets/appbar_widget.dart';
import 'package:wether_app_10_10_22/widgets/drawer_widget.dart';
import 'package:wether_app_10_10_22/widgets/daily_forecast_weather.dart';
import 'package:wether_app_10_10_22/widgets/hourly_forecast_weather.dart';
import 'package:wether_app_10_10_22/widgets/title_widget.dart';
import 'package:wether_app_10_10_22/widgets/weather_city_widget.dart';

class HomeScreen extends GetView<HomeController> {
  final homeCtrl = Get.put<HomeController>(HomeController());
  final WeatherData? weatherData;

  HomeScreen({Key? key, this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtrl.isLoading.isTrue
          ? LoadingPage()
          : Scaffold(
              drawer: DrawerWidget(),
              extendBodyBehindAppBar: true,
              appBar: AppBarWidget(),
              body: SafeArea(
                child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: SweepGradient(
                      center: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFF3F2F3),
                        Color(0xFF8BD3E1),
                        Color(0xFF005AA7),
                      ],
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    //physics: const NeverScrollableScrollPhysics(),
                    children: [
                      WeatherCity(
                        header: homeCtrl.getWeatherData().weatherHeader(),
                        weatherDataCurrent:
                            homeCtrl.getWeatherData().weatherDataCurrent(),
                      ),
                      const TitleWidget(
                        titleName: 'Today',
                      ),
                      HourlyForecastWeather(
                        weatherDataHourly:
                            homeCtrl.getWeatherData().weatherDataHourly(),
                        header: homeCtrl.getWeatherData().weatherHeader(),
                      ),
                      const TitleWidget(titleName: 'Next 7 Days'),
                      DailyForecast7Days(
                        weatherDataDaily:
                            homeCtrl.getWeatherData().weatherDataDaily(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
