import 'package:flutter/material.dart';

import '../common/theme/colors.dart';
import '../common/theme/text.dart';

Future<void> showLoaderDialog(context, String text) async {
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
              CircularProgressIndicator(
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