import 'package:flutter/material.dart';
import 'package:wether_app_10_10_22/widgets/appbar_widget.dart';
import 'package:wether_app_10_10_22/widgets/title_widget.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    //final blockSizeWidth = width / 100;
    final blockSizeHeight = height / 100;
    final blockSize = width / 100 + width / 100;
    //final double fontSize = blockSizeWidth;
    return Scaffold(
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
            children: [
              Container(
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
                  ],
                ),
                width: double.infinity,
                height: blockSize * 27,
                child: Padding(
                  padding: EdgeInsets.only(top: blockSizeHeight * 0.5),
                  child: Container(),
                ),
              ),
              const TitleWidget(titleName: 'Today'),
              Container(
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
                child: const Center(child: CircularProgressIndicator()),
              ),
              const TitleWidget(titleName: 'Next 7 Days'),
              Container(
                margin: EdgeInsets.all(blockSize * 1.0),
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
                height: blockSizeHeight * 34.5,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
