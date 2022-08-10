import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';

class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu({
    Key? key,
    required this.parent,
    required this.menuList,
  }) : super(key: key);
  final List<PopupMenuEntry> menuList;
  final Widget parent;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      color: kDialogBg,
      itemBuilder: (ctx) => menuList,
      icon: parent,
    );
  }
}
