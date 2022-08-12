import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/screens/login/common_login_card_view.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({Key? key}) : super(key: key);

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  bool isPassHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
          backgroundColor: kEmptyColor,
          body: CommonLoginCardView(
              isPassHidden: isPassHidden,
              onEyeTapped: () {
                setState(() => isPassHidden = !isPassHidden);
              })),
    );
  }
}
