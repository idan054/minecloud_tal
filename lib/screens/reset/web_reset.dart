import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/functions/webpopups/buildicons.dart';
import 'package:minecloud_tal/screens/reset/common_reset_card_view.dart';
import 'package:minecloud_tal/widgets/components/mainBoardingSlider.dart';

class WebResetPass extends StatefulWidget {
  const WebResetPass({Key? key}) : super(key: key);

  @override
  State<WebResetPass> createState() => _WebResetPassState();
}

class _WebResetPassState extends State<WebResetPass> {
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
  Widget build(BuildContext context) {
    var height = maxHeight(context) / 100;
    return Scaffold(
      backgroundColor: kEmptyColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainBoardingSlider(_selectedIndex, _pageController),
                SizedBox(
                  height: height * 2,
                ),
                buildIconRow(context),
              ],
            ),
          ),
          if (maxHeight(context) > 1300)
            Expanded(
              flex: 2,
              child: Container(),
            ),
          const Expanded(
            flex: 3,
            child: CommonResetCardView(isWeb: true),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
