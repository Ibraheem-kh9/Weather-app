// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:wether_app_10_10_22/controller/splash_Ctrl.dart';
// import 'package:wether_app_10_10_22/utils/responsive_size.dart';
//
// class LoadingPage extends GetView<SplashController> {
//   final splashCtrl = Get.put<SplashController>(SplashController());
//   LoadingPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//
//     final blockSize = height / 100;
//     final blockSizeVertical = height / 100;
//     double elementWidth = blockSize * 10.0;
//     double fontSize = blockSize;
//     final blockSizeWidth = width / 100;
//     SizeConfig().init(context);
//     return Scaffold(
//       backgroundColor: Color(0xFFA8D1E7),
//       body: SafeArea(
//           child: Container(
//               // decoration: BoxDecoration(
//               //     gradient: LinearGradient(
//               //         colors: [Color(0xFFF8ED6D), Color(0xFFA8D1E7)],
//               //         begin: Alignment.topCenter,
//               //         end: Alignment.center
//               //         // stops: [
//               //         //   0.3,0.4,
//               //         // ]
//               //         )),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: -110.0,
//                     left: -110.0,
//                     child: Icon(
//                       Icons.sunny,
//                       color: Color(0xFFF8ED6D),
//                       size: 300.0,
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       AnimatedTextKit(
//                         animatedTexts: [
//                           TyperAnimatedText(
//                             'Weather Forecast',
//                             speed: Duration(milliseconds: 200),
//                             textStyle: TextStyle(
//                                 fontSize: fontSize * 4,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFFFA744F),
//                                 shadows: [
//                                   Shadow(
//                                       color: Colors.cyan,
//                                       blurRadius: 3.55,
//                                       offset: Offset.zero),
//                                 ]),
//                           ),
//                         ],
//                         totalRepeatCount: 1,
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       SpinKitRing(
//                         color: Color(0xFFFA744F),
//                         size: 60.0,
//                       ),
//                     ],
//                   ),
//                 ],
//               ))),
//     );
//   }
// }
