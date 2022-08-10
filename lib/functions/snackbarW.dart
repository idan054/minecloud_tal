import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';

import '../screens/syncProgress_page.dart';
import '../widgets/simpleWs.dart';

void showMySnackBar(context, VoidCallback closeAction) =>
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.fixed,
          backgroundColor: kEmptyColor,
          elevation: 0,
          content: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
              decoration: const BoxDecoration(
                  color: kDialogBg,
                  borderRadius: BorderRadius.all(Radius.circular(11),
                  )),
              child: Row(
                children: [
                  Text("Download completed.",
                    style: poppinsRegular().copyWith(fontSize: 12),),
                  const Spacer(),
                  SizedBox(
                    height: 32,
                    child: TextButton(
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                            backgroundColor: MaterialStateProperty.all(kTapBorderAssets),
                            foregroundColor: MaterialStateProperty.all(kDetailedWhite60),
                        ),
                        onPressed: () => kPushNavigator(context, const SyncProgressPage()),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Text(' Show',
                              style: poppinsRegular().copyWith(fontSize: 12),
                          ),
                        )),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                      onTap: () =>
                          ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                      child: circleIcon(closeButton: true))
                ],
              )),
          duration: const Duration(seconds: 6),
        ));
