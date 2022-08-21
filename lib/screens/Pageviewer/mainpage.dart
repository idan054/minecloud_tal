import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/screens/Pageviewer/web_main.dart';
import 'mobile_mai.dart';

class MainPage extends StatelessWidget {
  final bool isLocalPage;
  final bool isPackView;

  const MainPage({this.isLocalPage = true, required this.isPackView, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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

