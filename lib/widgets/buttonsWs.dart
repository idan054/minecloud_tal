import 'package:flutter/material.dart';
import '../common/theme/colors.dart';
import '../common/theme/text.dart';

Widget positiveButton(String text) =>
    Container(
      decoration: BoxDecoration(
        gradient: positiveBlueButtonGradient,
        borderRadius: BorderRadius.circular(99), // <-- Radius
      ),
      child: ElevatedButton(onPressed: (){},
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99), // <-- Radius
              ),)

        ),
        child: Text(text, style: poppinsMedium().copyWith(fontSize: 15),),),
    );