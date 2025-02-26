import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Util {

  static Widget buildSvgIcon(
      String assetName,
      int index,
      int currentIndex, {
        Color selectedColor = Colors.blue,
        Color unselectedColor = Colors.grey,
        double size = 22,
      }) {
    return SvgPicture.asset(
      assetName,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        currentIndex == index ? selectedColor : unselectedColor,
        BlendMode.srcIn,
      ),
    );
  }

}