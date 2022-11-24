import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:wether_app_10_10_22/controller/home_ctrl.dart';
import 'package:wether_app_10_10_22/models/weather_data.dart';
import 'package:wether_app_10_10_22/services/fetch_data.dart';
import 'package:wether_app_10_10_22/views/home_screen.dart';

class SearchController extends GetxController {
  final searchTextEditing = TextEditingController();
  final RxDouble latitudeCity = 0.0.obs;
  final RxDouble longitudeCity = 0.0.obs;
  final weatherData = WeatherData().obs;
  RxBool isLoading = true.obs;

  Future<WeatherData> getCoordinateFromCityName(searchTextEditing) async {
    var coordinate = await locationFromAddress(searchTextEditing);
    for (var element in coordinate) {
      latitudeCity.value = element.latitude;
      longitudeCity.value = element.longitude;

      //await getCityNameFromCoordinate(latitudeCity.value,longitudeCity.value);
    }
    // coordinate.forEach((element) async {
    //   latitudeCity.value = element.latitude;
    //   longitudeCity.value = element.longitude;
    //   print(latitudeCity.value);
    //   print(longitudeCity.value);
    //   //await getCityNameFromCoordinate(latitudeCity.value,longitudeCity.value);
    // });
    return await FetchDataAPI().getLocationData(latitudeCity.value, longitudeCity.value).then((value) =>weatherData.value = value
    //  isLoading.value = false;
   //return weatherData.value = value;
   );
  }

  getCityNameFromCoordinate(lat , long) async {
    await placemarkFromCoordinates(lat, long).then((List<Placemark> placemarks){
      Placemark mark = placemarks[0];
      print(mark.locality);
      Get.to(HomeScreen(),arguments:[mark.locality] );
    });
  }
}

/*
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:wether_app_10_10_22/models/weather_data.dart';
import 'package:wether_app_10_10_22/services/fetch_data.dart';

class SearchController extends GetxController {
  final searchTextEditing = TextEditingController().obs;
  final RxBool isLoading = true.obs;
  final weatherData = WeatherData().obs;
  RxString cityNameEnter = ''.obs;
  List<Location>? placeMark;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  dynamic data;
  // @override
  // void onInit() {
  //   getCoordinateFromCityName(String name);
  //   super.onInit();
  // }

  getCoordinateFromCityName(String searchTextEditing) async {
    placeMark = await locationFromAddress(searchTextEditing);
    placeMark?.forEach((element) async{
      latitude.value = element.latitude;
      longitude.value = element.longitude;

      // var data  = await FetchDataAPI()
      //     .getLocationData(element.latitude, element.longitude)
      //     .then((value) {
      //   weatherData.value = value;
      //   isLoading.value = false;
      // });
      // print(data);
    });


    // var data = await FetchDataAPI()
    //     .getLocationData(this.latitude, this.longitude)
    //     .then((value) {
    //   weatherData.value = value;
    //   //isLoading.value = false;
    // });
    // print('positionLatitude : $latitude');
    // print('positionLongitude : $longitude');
    // Get.back(result:data );

    // return data;
  }

// placeMark?.map((e)  {
//   latitude.value = e.latitude ;
//   longitude.value = e.longitude;
//   print(latitude.value);
//   var position = FetchDataAPI()
//       .getLocationData(latitude.value, longitude.value)
//       .then((value) => weatherData.value = value);
//   return position;
//
// }
// );
// print(longitude.value);

 searchCityFromCoordinates() async {
  var data = await FetchDataAPI()
      .getLocationData(latitude.value, longitude.value)
      .then((value) => weatherData.value = value).then((value) {

        Get.back(result: value);
        print(value);
  });
  //     .then((value) {
  //       Get.back(result: value);
  // });
  print(data);
  //return data;
}
}
*/
