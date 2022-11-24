import 'package:flutter/material.dart';

class DetailsDesign2SubWidget extends StatelessWidget {
  final IconData? icon;
  final String? textName;
  final String? dataApi;
  final String? dataApiValue;

  const DetailsDesign2SubWidget(
      {Key? key, this.icon, this.textName, this.dataApi, this.dataApiValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        border: Border(
          top: BorderSide(color: Color(0xFFF4D096), width: 2.0),
          right: BorderSide(color: Color(0xFFF4D096), width: 2.0),
          left: BorderSide(color: Color(0xFFF4D096), width: 2.0),
          bottom: BorderSide(color: Color(0xFFF4D096), width: 2.0),
        ),
        gradient: LinearGradient(
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
                icon,
                size: 15.0,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                textName!,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: dataApi,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: dataApiValue,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
