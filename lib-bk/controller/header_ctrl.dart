import 'package:get/get.dart';
import 'package:wether_app_10_10_22/controller/home_ctrl.dart';
import 'package:wether_app_10_10_22/models/weather_data.dart';

class HeaderController extends GetxController{

  @override
  void onInit() {
    getCityDetails();
    super.onInit();
  }

  Future<WeatherData> getCityDetails() async {
    GlobalController? homeController;
    return homeController!.getLocation();

  }

}