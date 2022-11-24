import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app_10_10_22/controller/home_ctrl.dart';
import 'package:wether_app_10_10_22/views/search_screen.dart';

class DrawerWidget extends StatelessWidget {
  final homeCtrl = Get.put<HomeController>(HomeController());
  DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF8BD3E1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: SweepGradient(

              center: Alignment.topRight,
              startAngle: 0.1,
              endAngle:  4.0,
              colors: [
                Color(0xFFF3F2F3),
                Color(0xFF8BD3E1),
                Color(0xFF005AA7),
              ], /*begin: Alignment.topLeft,end: Alignment.bottomCenter*/
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Padding(
                padding: EdgeInsets.only(top: 15.0, left: 15.0),
                child: Text(
                  'Weather',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF4D096),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 25.0),
                child: TextButton(
                  onPressed: () async {
                    navigator?.pop(context);
                    var city = await Get.to(() => SearchScreen());
                    if (city != null) {
                      //homeCtrl.weatherData.value = await city;
                      homeCtrl.weatherData.value = city;
                    } else {
                      Get.snackbar('City Not Found', 'Please enter Correct Name');
                    }
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.search,size: 25.0,color: Color(0xFFF4D096),),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF006092),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.settings,size: 25.0,color: Color(0xFFF4D096),),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Setting',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF006092),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.notifications,size: 25.0,color: Color(0xFFF4D096),),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF006092),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
