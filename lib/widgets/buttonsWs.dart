import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../common/theme/colors.dart';
import '../common/theme/text.dart';

Widget positiveButton(String text, {VoidCallback? onPressed}) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: positiveBlueButtonGradient,
        borderRadius: BorderRadius.circular(999), // <-- Radius
      ),
      child: ElevatedButton(onPressed: onPressed,
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

Widget secondaryIconButton({
  required String text, Widget? iconW}) =>
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
               EdgeInsets.symmetric(vertical:
                iconW == null ? 16 : 13)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                    color: kSecondaryButton,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(99), // <-- Radius
              ),)

        ),
        icon: iconW ?? const Icon(Icons.hide_image, size: 0),
        label: Text(text,
          style: poppinsMedium().copyWith(fontSize: 14),),),
    );