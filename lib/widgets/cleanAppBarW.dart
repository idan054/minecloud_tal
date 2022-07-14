import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/constants.dart';

import '../common/theme/colors.dart';
import '../common/theme/text.dart';

AppBar cleanAppBar(String title, {PreferredSizeWidget? chipsW}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: kTapBorderAssets,
    // leading: IconButton(
    //   icon: Icon(Icons.menu),
    //   onPressed: () => Scaffold.of(context).openDrawer(),
    // ),
    title: Text(
      title,
      style: poppinsMedium(),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(
          radius: 15,
          backgroundColor: kTapBorderAssets,
        ),
      )
    ],
    toolbarHeight: chipsW == null ? 55 : 75, // 55 = default
    bottom: chipsW,
  );
}