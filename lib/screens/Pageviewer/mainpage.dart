import 'package:flutter/material.dart';
import 'package:minecloud_tal/Responsive/responsive.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/screens/Pageviewer/web_main.dart';

import '../../common/theme/colors.dart';
import 'mobile_mai.dart';

class MainPage extends StatelessWidget {
  final bool isLocalPage;
  final bool isPackView;

  MainPage({required this.isLocalPage, required this.isPackView, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = maxHeight(context) / 100;
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
        backgroundColor: kEmptyColor,
        body:  LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth < 600) {
          return MobileMainPage(isLocalPage: isLocalPage,isPackView: isPackView,);
        } else {
          return WebMainPage(isLocalPage: isLocalPage,isPackView: isPackView,);
        }
      }),
    )
      ),
    );
  }
}


  // mobileLayout: MobileMainPage(isLocalPage: isLocalPage,isPackView: isPackView,),
  //         webLayout: WebMainPage(isLocalPage: isLocalPage,isPackView: isPackView,),
