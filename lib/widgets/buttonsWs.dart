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
        child: Text(text,
          style: poppinsMedium().copyWith(fontSize:
            text == 'Cancel' ? 12 : 14),),),
    );

Widget secondaryIconButton({
  required String text,
  Widget? iconW,
  VoidCallback? onPressed,
  Color buttonColor = kTapBorderAssets,
  bool miniMode = false}) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(buttonColor),
            minimumSize: MaterialStateProperty.all(const Size(999, 0)),
            padding: MaterialStateProperty.all(
               EdgeInsets.symmetric(vertical:
               miniMode ? 10 :
                iconW == null ? 16 : 13)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                    color: miniMode ? kEmptyColor : kSecondaryButton,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(99), // <-- Radius
              ),)

        ),
        icon: iconW ?? const Icon(Icons.hide_image, size: 0),
        label: Text(text,
          style: poppinsMedium().copyWith(fontSize:
            miniMode ? 12 : 14),),),
    );