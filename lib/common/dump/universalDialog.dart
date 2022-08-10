import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/functions/bottomSheetW.dart';
import 'package:minecloud_tal/widgets/buttonsWs.dart';


Future<void> universalDialog(
    BuildContext context, {
      String? title,
      String? desc,
      String? mainTxtButton,
      VoidCallback? mainPressed,
      String? secondaryTxtButton,
      VoidCallback? secondaryPressed,
    }) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: darkBg,
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTopTitle(context, title: title),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text('$desc',
                    style: poppinsRegular().copyWith(color: kDetailedWhite60)),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  const SizedBox(width: 85),
                  if(secondaryTxtButton != null)
                    Expanded(
                        child: secondaryIconButton(
                            text: secondaryTxtButton,
                            onPressed: secondaryPressed,
                            miniMode: true,
                            showBorder: false,
                        )),
                  Expanded(
                      child: secondaryIconButton(
                          text: '$mainTxtButton',
                          miniMode: true,
                          showBorder: false,
                          buttonColor: kLoadingGrey,
                          onPressed: mainPressed)),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ));
    },
  );
}
