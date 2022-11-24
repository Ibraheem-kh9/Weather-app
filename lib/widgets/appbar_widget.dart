import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app_10_10_22/controller/home_ctrl.dart';
import 'package:wether_app_10_10_22/widgets/more_details_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final homeCtrl = Get.put<HomeController>(HomeController());

  AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    // final blockSizeWidth = width / 100;
    // final blockSizeHeight = height / 100;
    // final blockSize = width / 100.0 + width / 100.0;
    // final double fontSize = blockSizeWidth;
    return AppBar(
      iconTheme: const IconThemeData(color: Color(0xFFF4D096), size: 30.0),
      //backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF74BDE0),
              Color(0xFF95B3CA),
            ],
          ),
        ),
      ),
      actions: [
        Obx(
          () => IconButton(
            onPressed: () async {
              await Get.bottomSheet(
                 MoreDetailsWidget(
                        header: homeCtrl.getWeatherData().weatherHeader(),
                        weatherDataCurrent:
                            homeCtrl.getWeatherData().weatherDataCurrent(),
                      )

              );
            },
            icon: homeCtrl.isOpen.isTrue
                ? const Icon(
                    Icons.expand_less,
                    color: Color(0xFFF4D096),
                    size: 37.0,
                  )
                : const Icon(
                    Icons.expand_more,
                    color: Color(0xFFF4D096),
                    size: 37.0,
                  ),
          ),
        ),
      ],
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
