import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wether_app_10_10_22/models/weather_data.dart';
import 'package:wether_app_10_10_22/services/fetch_data.dart';

class HomeController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;
  RxInt sec = 0.obs;
  //final Rx day = true.obs;
  RxBool isOpen = false.obs;
  final weatherData = WeatherData().obs;
  final date = DateFormat.yMMMMd('en_US').format(DateTime.now()).toString();

  getWeatherData(){
    return weatherData.value;
  }


  @override
  void onInit() {
    if (isLoading.isTrue) {
      locationData();
    } else {
      getIndex();
    }
    super.onInit();
  }
  @override
  void onClose() {
    weatherData.close();
    super.onClose();
  }

  locationData() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.requestPermission();
      //return
      //return serviceEnabled;
      return weatherData.refresh();
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low)
          .then((value) {
        _latitude.value = value.latitude;
        _longitude.value = value.longitude;

        return FetchDataAPI()
            .getLocationData(value.latitude, value.longitude)
            .then((value) {
          weatherData.value = value;
          isLoading.value = false;

        });
      });
  }

  RxInt getIndex() {
    return _currentIndex;
  }

   getTime(final timestamp ,final zone ) {
     sec.value =  Duration(seconds: zone).inHours;

    DateTime timeToInt = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).add(Duration(hours: sec.value)).toUtc();
     String x = DateFormat('j').format(timeToInt);
    return x;
  }

  String getDate(final datestamp){
    var dateToString = DateTime.fromMillisecondsSinceEpoch(datestamp * 1000);
    String y = DateFormat.EEEE().format(dateToString);
    return y;
  }

  /// get time for sunset of widget
  getSunSetTime(final timestamp ,final zone ) {
    sec.value =  Duration(seconds: zone).inHours;

    DateTime timeToInt = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).add(Duration(hours: sec.value)).toUtc();
    String x = DateFormat('jm').format(timeToInt);
    return x;
  }

  getVisibility(final vis){
    var _val = vis / 1000;
    return _val;
  }
}
