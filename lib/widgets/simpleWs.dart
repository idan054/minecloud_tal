import 'package:flutter/material.dart';

import '../common/theme/colors.dart';

Widget lightDivider() =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      color: kTapBorderAssets,
      height: 1,
    );

Widget circleIcon({IconData? icon, bool closeButton = false}) {
  return CircleAvatar(
      radius: closeButton ? 15 : 20,
      backgroundColor: kTapBorderAssets,
      foregroundColor: kDetailedWhite60,
      child: Icon(closeButton ? Icons.close : icon));
}