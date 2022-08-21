import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/text.dart';

Future<void> showLoaderDialog(context, {String text = 'Loading your data...'}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          shape:
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          backgroundColor: kDialogBg,
          content:
          Row(
            children: [
              const CircularProgressIndicator(
                color: kSecondaryButton,
                strokeWidth: 4,
              ),
              const SizedBox(width: 15),
              Text(text, style: poppinsRegular())
            ],
          )
      );
    },
  );
}