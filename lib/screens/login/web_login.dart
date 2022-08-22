import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/functions/webpopups/buildIcons.dart';
import 'package:minecloud_tal/screens/login/common_login_card_view.dart';
import 'package:minecloud_tal/widgets/components/mainBoardingSlider.dart';

class WebLogin extends StatefulWidget {
  const WebLogin({Key? key}) : super(key: key);

  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  bool isPassHidden = true;
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer t) {
      setState(() {
        _selectedIndex = _selectedIndex + 1;
        if (_selectedIndex == 3) _selectedIndex = 0;
      });
      debugPrint('_selectedIndex $_selectedIndex');
      _pageController.animateToPage(_selectedIndex,
          curve: Curves.easeInOut, duration: const Duration(milliseconds: 250));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height =  maxHeight(context) / 100;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainBoardingSlider(/*_selectedIndex, _pageController*/),
                SizedBox(
                  height: height*2,
                ),
               buildIconRow(context),
              ],
            ),
          ),
          if(maxHeight(context) >1300)
          Expanded(flex: 2,child: Container(),),
          Expanded(
            flex: 3,
            child:
            CommonLoginCardView(
                isPassHidden: isPassHidden,
                isWeb: true,
                onEyeTapped: () {
                  setState(() => isPassHidden = !isPassHidden);
                })
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
