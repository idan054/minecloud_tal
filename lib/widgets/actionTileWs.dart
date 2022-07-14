import 'package:flutter/material.dart';
import '../common/theme/colors.dart';
import '../common/theme/constants.dart';
import '../common/theme/text.dart';
import 'simpleWs.dart';

Widget actionTile(
    IconData icon,
    String name, {
      String? subTitle,
      VoidCallback? onTap,
    }) {
  return ListTile(
    leading: circleIcon(icon: icon),
    onTap: onTap,
    title: Text(
      name,
      style: poppinsRegular().copyWith(fontSize: 11),
    ),
    subtitle: subTitle != null
        ? Text(subTitle,
        style: poppinsRegular()
            .copyWith(fontSize: 9, color: kDetailedWhite60))
        : null,
  );
}

Widget quickTile(
     {
      IconData? leadingIcon,
      IconData? trailingIcon,
      required String name,
      VoidCallback? onTap,
    }) {
  return ListTile(
    horizontalTitleGap: 4.0, // 16 default
    leading: Icon(leadingIcon, color: kImportantWhite80,),
    trailing: Icon(trailingIcon, color: kVerySpecificWhite40,),
    title: Text(
      name, style: poppinsRegular().copyWith(fontSize: 11),
    ),
    onTap: onTap,
  );
}