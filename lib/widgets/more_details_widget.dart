import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app_10_10_22/controller/home_ctrl.dart';
import 'package:wether_app_10_10_22/models/weather/weather.dart';
import 'package:wether_app_10_10_22/models/weather_data_current.dart';
import 'package:wether_app_10_10_22/widgets/sub_widget/details_design_2_subwidget.dart';
import 'package:wether_app_10_10_22/widgets/sub_widget/details_design_subwidget.dart';

class MoreDetailsWidget extends StatelessWidget {
  final homeCtrl = Get.put<HomeController>(HomeController());
  final WeatherDataCurrent? weatherDataCurrent;
  final Weather? header;

  MoreDetailsWidget(
      {Key? key, required this.weatherDataCurrent, required this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(

        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // stops: [
          //   2.0,
          //   2.0,
          //   5.0,
          // ],
          colors: [
            //Color(0xFFF3F2F3),
            Color(0xFF2B32B2),
            //Color(0xFF005AA7),
            Color(0xFF1488CC),
            //Color(0xFF8BD3E1),
          ], /*begin: Alignment.topLeft,end: Alignment.bottomCenter*/
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
      ),
      child: GridView.count(
        //dragStartBehavior: DragStartBehavior.values[1],
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10.0),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.2,
        children: [
          DetailsDesignSubWidget(
            icon: Icons.wb_sunny_outlined,
            textName: 'UV INDEX',
            dataApi: '${weatherDataCurrent!.current!.uvi?.truncate()}',
          ),

          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              border: Border(top:BorderSide(color: Color(0xFFF4D096),width: 2.0), right:BorderSide(color: Color(0xFFF4D096),width: 2.0), left:BorderSide(color: Color(0xFFF4D096),width: 2.0), bottom:BorderSide(color: Color(0xFFF4D096),width: 2.0),),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF74BDE0),
                  Color(0xFF95B3CA),
                ],
              ),
            ),
            //color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.wb_sunny_rounded,
                      size: 12.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'SunSet',
                      style: TextStyle(fontSize: 12.0, color: Colors.white,),
                    )
                  ],
                ),
                Text(
                  homeCtrl.getSunSetTime(
                      weatherDataCurrent!.current!.sunset,
                      header!.timezoneOffset),
                  style: const TextStyle(fontSize: 22.0, color: Colors.white,),
                ),

                /////

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.wb_sunny_rounded,
                      size: 12.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'SunRise',
                      style: TextStyle(fontSize: 12.0, color: Colors.white,),
                    )
                  ],
                ),
                Text(
                  homeCtrl.getSunSetTime(
                      weatherDataCurrent!.current!.sunrise,
                      header!.timezoneOffset),
                  style: const TextStyle(fontSize: 22.0, color: Colors.white,),
                ),
              ],
            ),
          ),


          DetailsDesign2SubWidget(
            icon: Icons.wind_power,
            textName: 'Wind Speed',
            dataApi: '${weatherDataCurrent!.current!.windSpeed?.truncate()}',
            dataApiValue: ' Ml/h',
          ),

          DetailsDesignSubWidget(
            icon: Icons.wind_power,
            textName: 'FEELS LIKE',
            dataApi: '${weatherDataCurrent!.current!.feelsLike?.truncate()}',
          ),


          ///------------------------

          DetailsDesign2SubWidget(
            icon: Icons.visibility,
            textName: 'VISIBILITY',
            dataApi: homeCtrl
                .getVisibility(weatherDataCurrent!
                .current!.visibility!
                .toInt())
                .toString(),
            dataApiValue: ' Km',),

          ///------------------------
          DetailsDesignSubWidget(
            icon: Icons.online_prediction_sharp,
            textName: 'PRESSURE',
            dataApi: '${weatherDataCurrent!.current!.pressure?.truncate()}',
          ),
        ],
      ),
    );
  }
}


/*Container(
//padding: EdgeInsets.only(top: 20.0),
alignment: Alignment.topCenter,
decoration: BoxDecoration(
shape: BoxShape.circle,
gradient: const LinearGradient(
colors: [
Color(0xFF74BDE0),
Color(0xFF95B3CA),
],
),
),
child: Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.wb_sunny_outlined,
size: 12.0,
color: Colors.white,
),
SizedBox(
width: 10.0,
),
Text(
'UV INDEX',
style: TextStyle(fontSize: 12.0,color: Colors.white,fontWeight: FontWeight.bold),
)
],
),
Text(
'${weatherDataCurrent!.current!.uvi?.truncate()}',
style: TextStyle(fontSize: 25.0,color: Colors.white,),
),
],
),
),*/


/* Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF74BDE0),
                  Color(0xFF95B3CA),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wind_power,
                      size: 12.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'FEELS LIKE',
                      style: TextStyle(fontSize: 12.0,color: Colors.white,),
                    )
                  ],
                ),
                Text(
                  '${weatherDataCurrent!.current!.feelsLike?.truncate()}',
                  style: TextStyle(fontSize: 25.0,color: Colors.white,),
                ),
              ],
            ),
          ),*/


/*
Container(
decoration: BoxDecoration(
shape: BoxShape.circle,
gradient: const LinearGradient(
colors: [
Color(0xFF74BDE0),
Color(0xFF95B3CA),
],
),
),
child: Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.online_prediction_sharp,
size: 12.0,
color: Colors.white,
),
SizedBox(
width: 10.0,
),
Text(
'PRESSURE',
style: TextStyle(fontSize: 12.0,color: Colors.white,),
)
],
),
Text(
'${weatherDataCurrent!.current!.pressure?.truncate()}',
style: TextStyle(fontSize: 25.0,color: Colors.white,),
),
],
),
),*/

/*Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF74BDE0),
                  Color(0xFF95B3CA),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.visibility,
                      size: 12.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'VISIBILITY',
                      style: TextStyle(fontSize: 12.0,color: Colors.white,),
                    )
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: homeCtrl
                            .getVisibility(weatherDataCurrent!
                            .current!.visibility!
                            .toInt())
                            .toString(),
                        style: TextStyle(fontSize: 25.0,color: Colors.white,),
                      ),
                      TextSpan(
                        text: ' Km',
                        style: TextStyle(fontSize: 25.0,color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),*/

/*Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF74BDE0),
                  Color(0xFF95B3CA),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wind_power,
                      size: 12.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Wind Speed',
                      style: TextStyle(fontSize: 12.0,color: Colors.white,),
                    )
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                        '${weatherDataCurrent!.current!.windSpeed?.truncate()}',
                        style: TextStyle(fontSize: 25.0,color: Colors.white,),
                      ),
                      TextSpan(
                        text: ' Ml/h',
                        style: TextStyle(fontSize: 15.0,color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),*/