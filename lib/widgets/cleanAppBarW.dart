import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/constants.dart';

import '../common/theme/colors.dart';
import '../common/theme/text.dart';
import '../functions/accountDialog.dart';

AppBar cleanAppBar(context, String title, {PreferredSizeWidget? chipsW}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: kTapBorderAssets,
    title: Text(
      title,
      style: poppinsMedium(),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: IconButton(
          onPressed: (){

            accountDialog(context,
                mainTxtButton: 'Go to settings',
                mainPressed: () => kNavigator(context).pop()
            );

          },
          icon: const CircleAvatar(
            radius: 15,
            backgroundColor: kTapBorderAssets,
          ),
        ),
      )
    ],
    toolbarHeight: chipsW == null ? 55 : 75, // 55 = default
    bottom: chipsW,
  );
}