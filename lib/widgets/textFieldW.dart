import 'package:flutter/material.dart';

import '../common/theme/colors.dart';
import '../common/theme/text.dart';

Widget darkTxtField({
  required String label,
  required String hintText,
}) =>
    Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 7.5),
          child: Text(label, style: poppinsRegular()
              .copyWith(fontSize: 13)),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black26,
                border: InputBorder.none,
                hintText: hintText,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,horizontal: 10),
                hintStyle: poppinsRegular()
                    .copyWith(
                    color: kVerySpecificWhite40)

            ),
          ),
        ),
      ],
    );