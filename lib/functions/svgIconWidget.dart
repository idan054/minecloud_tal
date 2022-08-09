import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/theme/constants.dart';

Widget buildSvgIconBox(String svg,BuildContext context) {
     var height =  maxHeight(context) / 100;
    return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3), shape: BoxShape.circle),
        padding: EdgeInsets.all(10),
        child: SvgPicture.asset(
          svg,
          color: Colors.white,
          width: 2,
        ));
  }