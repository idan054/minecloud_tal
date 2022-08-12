import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/screens/reset/common_reset_card_view.dart';

class MobileResetPass extends StatefulWidget {
  const MobileResetPass({Key? key}) : super(key: key);

  @override
  State<MobileResetPass> createState() => _MobileResetPassState();
}

class _MobileResetPassState extends State<MobileResetPass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: const Scaffold(
        backgroundColor: kEmptyColor,
        body: CommonResetCardView(),
      ),
    );
  }
}
