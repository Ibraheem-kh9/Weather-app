import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app_10_10_22/controller/srch_ctrl.dart';

class SearchScreen extends GetView {
  final srchCtrl = Get.put<SearchController>(SearchController());

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final blockSizeWidth = width / 100;
    final blockSizeHeight = height / 100;
    final blockSize = width / 100 + width / 100;
    final double fontSize = blockSizeWidth;
    RxString cityName = ''.obs;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: SweepGradient(
            center: Alignment.bottomRight,
            colors: [
              Color(0xFFF3F2F3),
              Color(0xFF8BD3E1),
              Color(0xFF005AA7),
            ],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: blockSizeHeight * 0.5),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    color: Color(0xFFF4D096),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: blockSizeHeight * 2.5,
                  left: blockSizeWidth * 4.0,
                ),
                child: Text(
                  'Find your Favorite City',
                  style: TextStyle(
                    fontSize: fontSize * 5,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF006092),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(blockSize * 2.1),
                child: TextFormField(
                  controller: srchCtrl.searchTextEditing,
                  onChanged: (value) {
                    cityName.value = value;
                  },
                  autofocus: true,
                  style: const TextStyle(
                      color: Color(0xFF006092), fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Search for a favorite city',
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(blockSize * 1.5),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    fillColor: Colors.white70,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF4D096),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      fixedSize:
                          Size(blockSizeWidth * 55.0, blockSizeHeight * 5.5)),
                  onPressed: () {

                    var details = srchCtrl.getCoordinateFromCityName(
                        srchCtrl.searchTextEditing.text);
                    //srchCtrl.getCoordinateFromCityName(srchCtrl.searchTextEditing.toString());
                    //Get.back(result:srchCtrl.searchTextEditing.toString());
                    Get.back(result: details);
                    //Get.to(HomeScreen(),arguments: [details]);
                    srchCtrl.searchTextEditing.clear();
                  },
                  child: Text(
                    'Find',
                    style: TextStyle(
                      fontSize: fontSize * 5.0,
                      color: const Color(0xFF006092),
                      fontWeight: FontWeight.bold,
                    ),
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
