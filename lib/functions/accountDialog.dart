import 'package:flutter/material.dart';
import '../common/theme/colors.dart';
import '../common/theme/constants.dart';
import '../common/theme/text.dart';
import '../screens/login/login.dart';
import '../widgets/questionAnswer.dart';
import '../widgets/simpleWs.dart';
import 'bottomSheetW.dart';
import 'dart:math' as math;


Future<void> accountDialog(
  BuildContext context, {
  String? mainTxtButton,
  VoidCallback? mainPressed,
  String? secondaryTxtButton,
  VoidCallback? secondaryPressed,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: darkBg,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTopTitle(context,
                  customTitle: Center(
                      child: Image.asset(
                    'assets/images/minecloudLogo.png',
                    height: 27.5,
                  )),
                  showDivider: false),

              ListTile(
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundColor: kTapBorderAssets,
                  ),
                  onTap: () {},
                  title: Text(
                    'Account',
                    style: poppinsMedium().copyWith(fontSize: 14),
                  ),
                  // todo show User email here
                  subtitle: Text('talme20@gmail.com',
                      style: poppinsRegular()
                          .copyWith(fontSize: 11, color: kDetailedWhite60)),
                  trailing: Icon(
                    Icons.launch,
                    color: kVerySpecificWhite40,
                    size: 20,
                  )),
              const AccountDetails(
                question: 'מה הדרך הנכונה להיות גבר?',
                answer: 'פשוט תקלל מל עד שתרגיש גבר אחושרמוטה יואו',
              ),



              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: lightDivider(),
              ),
              ListTile(
                  horizontalTitleGap: 0,
                  leading: Transform.rotate(
                    angle: 180 * math.pi / 180,
                    child: Icon(
                      Icons.logout,
                      color: kDetailedWhite60,
                      size: 22,
                    ),
                  ),
                  onTap: () {
                  // todo logout Auth
                    kPushNavigator(context,  const LoginScreen());
                  },
                  title: Text('Log Out',
                      style: poppinsRegular()
                          .copyWith(fontSize: 12)),
              ),
            ],
          ));
    },
  );
}
