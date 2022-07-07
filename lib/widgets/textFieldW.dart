import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/theme/colors.dart';
import '../common/theme/text.dart';

Widget darkTxtField({
  required String label,
  required String hintText,
  bool isPass = false,
  bool? isPassHidden,
  GestureTapCallback? onEyeTapped,
})
    {

      return Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 7.5),
            child: Text(label, style: poppinsRegular().copyWith(fontSize: 13)),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TextField(
              obscureText: isPass ? isPassHidden! : false,
              style: poppinsRegular().copyWith(color: kPositiveWhite),
              decoration: InputDecoration(
                  suffixIcon: isPass ?
                  // suffix: isPass ?
                      InkWell(
                          onTap: onEyeTapped,
                          child: SizedBox.shrink(
                            child: Row(
                              children: [
                                VerticalDivider(
                                  indent: 10,
                                  endIndent: 10,
                                  thickness: 1.5,
                                  color: kSecondaryButton,
                                ),
                                Icon(
                                    isPassHidden! ?
                                        Icons.visibility
                                        : Icons.visibility_off,
                                  color: kVerySpecificWhite40,
                                ),
                              ],
                            ),
                          )) : null,
                  filled: true,
                  fillColor: Colors.black26,
                  border: InputBorder.none,
                  hintText: hintText,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  hintStyle:
                      poppinsRegular().copyWith(color: kVerySpecificWhite40)),
            ),
          ),
        ],
      );
    }