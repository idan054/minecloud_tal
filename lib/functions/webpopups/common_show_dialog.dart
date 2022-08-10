import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/common/widgets/common_dialog_button.dart';
import 'package:minecloud_tal/functions/bottomSheetW.dart';

Future<void> commonShowDialog({
  required BuildContext context,
  required String title,
  required String desc,
  required String buttonTitle,
  String? cancelTitle,
  String? image,
  Function()? onTap,
  Function()? cancelOnTap,
  bool isCheckBox = false,
}) async {
  bool isCheck = true;
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: darkBg,
          contentPadding: EdgeInsets.zero,
          content: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            width: maxWidth(context) * 0.25,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTopTitle(context, title: title, image: image),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                          .copyWith(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (isCheckBox)
                        SizedBox(
                          height: 5,
                          width: 5,
                          child: Checkbox(
                              value: isCheck,
                              onChanged: (value) {
                                isCheck = !isCheck;
                              }),
                        ),
                      if (isCheckBox)
                        const SizedBox(
                          width: 30,
                        ),
                      Expanded(
                        child: Text(
                          desc,
                          style: poppinsRegular().copyWith(
                            color: kDetailedWhite60,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: maxHeight(context) * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: CommonDialogButton(
                        text: 'Cancel',
                        btnColor: kTapBorderAssets,
                        onPressed:
                            cancelOnTap ?? () => Navigator.of(context).pop(),
                      ),
                    ),
                    Expanded(
                      child: CommonDialogButton(
                        text: buttonTitle,
                        btnColor: kLoadingGrey,
                        onPressed: onTap,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ));
    },
  );
}
