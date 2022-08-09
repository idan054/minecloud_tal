 import 'package:flutter/material.dart';

import '../common/theme/constants.dart';

void showPopupMenu({required List<PopupMenuEntry<String>> popups,required BuildContext context}) async {
    await showMenu(
      color: Color(0x3E5F7E).withOpacity(0.8),
   
      context: context,
      // constraints: BoxConstraints(minWidth: 300,maxWidth:380 ),
      position: const RelativeRect.fromLTRB(100, 90, 70, 100),
      items: popups,
      elevation: 8.0,
    );
  }
  // void showSortMenu({required List<PopupMenuEntry<String>> popups,required BuildContext context}) async {
  //   await showMenu(
  //     color: Color(0x3E5F7E).withOpacity(0.8),
   
  //     context: context,
  //     constraints: BoxConstraints(minWidth: maxWidth(context)*0.15,maxWidth:maxWidth(context)*0.17 ),
  //     position:  RelativeRect.fromLTRB(100, 90, 1, 100),
  //     items: popups,
  //     elevation: 8.0,
  //   );
  // }
  //  void showReleaseMenu({required List<PopupMenuEntry<String>> popups,required BuildContext context}) async {
  //   await showMenu(
  //     color: Color(0x3E5F7E).withOpacity(0.8),
   
  //     context: context,
  //     constraints: BoxConstraints(minWidth: maxWidth(context)*0.15,maxWidth:maxWidth(context)*0.17 ),
  //     position: const RelativeRect.fromLTRB(100, 90, 70, 100),
  //     items: popups,
  //     elevation: 8.0,
  //   );

  // }