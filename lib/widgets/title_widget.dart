import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String? titleName;

  const TitleWidget({Key? key ,required this.titleName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final blockSizeWidth = width / 100;
    final blockSizeHeight = height / 100;
    //final blockSize = width / 100 + width / 100;
    final double fontSize = blockSizeWidth;
    return Padding(
      padding: EdgeInsets.only(
          top: blockSizeHeight * 2, left: blockSizeWidth * 2),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          titleName!,
          style: TextStyle(
            fontSize: fontSize * 5.0,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFF4D096),
          ),
        ),
      ),
    );
  }
}
