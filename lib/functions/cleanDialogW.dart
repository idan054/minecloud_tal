import 'package:flutter/material.dart';

import '../common/theme/colors.dart';
import '../common/theme/text.dart';
import '../widgets/buttonsWs.dart';
import 'bottomSheetW.dart';

Future<void> showCleanDialog(
  BuildContext context, {
  String? title,
  String? desc,
  required bool showButtons,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: !showButtons,
    builder: (BuildContext context) {
      return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: darkBg,
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTopTitle(context, title: title, image: 'image'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text('$desc',
                    style: poppinsRegular().copyWith(color: kDetailedWhite60)),
              ),
              const SizedBox(height: 25),
              if (showButtons)
                Row(
                  children: [
                    const SizedBox(width: 85),
                    Expanded(
                        child: secondaryIconButton(
                            text: 'Delete ', miniMode: true)),
                    Expanded(
                        child: secondaryIconButton(
                            text: 'Cancel ',
                            miniMode: true,
                            buttonColor: kLoadingGrey)),
                    const SizedBox(width: 15),
                  ],
                ),
              const SizedBox(height: 15),
            ],
          ));
    },
  );
}
