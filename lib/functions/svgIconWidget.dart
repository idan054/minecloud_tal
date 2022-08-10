import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildSvgIconBox(String svg,BuildContext context) {
    return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3), shape: BoxShape.circle),
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          svg,
          color: Colors.white,
          width: 2,
        ));
  }