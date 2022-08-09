import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:minecloud_tal/common/theme/colors.dart';

class CustomPopUpMenu extends StatelessWidget {
  CustomPopUpMenu({
    Key? key,
    required this.parent,
    required this.menuList,
  }) : super(key: key);
  List<PopupMenuEntry> menuList;
  Widget parent;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: PopupMenuButton(
        padding: EdgeInsets.zero,
        color: kDialogBg,
        itemBuilder: (ctx) => menuList,
        icon: parent,
        // position: PopupMenuPosition.under,
         
      ),
    );
  }
}
