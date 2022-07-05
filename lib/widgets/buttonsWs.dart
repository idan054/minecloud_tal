import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../common/theme/colors.dart';
import '../common/theme/text.dart';

Widget positiveButton(String text) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: positiveBlueButtonGradient,
        borderRadius: BorderRadius.circular(999), // <-- Radius
      ),
      child: ElevatedButton(onPressed: (){},
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            minimumSize: MaterialStateProperty.all(const Size(999, 0)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 15)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99), // <-- Radius
              ),)

        ),
        child: Text(text, style: poppinsMedium().copyWith(fontSize: 14),),),
    );

Widget secondaryIconButton(String text, Widget icon) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton.icon(
        onPressed: (){},
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(
                kTapBorderAssets),
            minimumSize: MaterialStateProperty.all(const Size(999, 0)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 13)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                    color: kSecondaryButton,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(99), // <-- Radius
              ),)

        ),
        icon: icon,
        label: Text(text,
          style: poppinsMedium().copyWith(fontSize: 14),),),
    );