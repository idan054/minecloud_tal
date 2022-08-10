import 'package:flutter/material.dart';
import 'package:minecloud_tal/functions/svgIconWidget.dart';

Widget buildIconRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildSvgIconBox('assets/svg/discord.svg', context),
      const SizedBox(
        width: 10,
      ),
      buildSvgIconBox('assets/svg/globe-913.svg', context),
      const SizedBox(
        width: 10,
      ),
      buildSvgIconBox('assets/svg/twitter.svg', context),
    ],
  );
}
