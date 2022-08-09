import 'package:flutter/material.dart';
import 'package:minecloud_tal/Responsive/responsive.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/screens/login/mobile_login.dart';
import 'package:minecloud_tal/screens/login/web_login.dart';
import 'package:minecloud_tal/screens/reset/mobile_reset.dart';
import 'package:minecloud_tal/screens/reset/web_reset.dart';

import '../../common/theme/colors.dart';
import '../../widgets/simpleWs.dart';

import 'package:flutter/material.dart';
import 'package:minecloud_tal/Responsive/responsive.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/screens/plans/mobile_plans.dart';
import 'package:minecloud_tal/screens/plans/web_plans.dart';
import '../../common/theme/colors.dart';
import '../Dashboard/dashboard.dart';

class ResetPage extends StatelessWidget {
  ResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      const MyResponsiveScreen(
        mobileScreen: MobileResetPass(),
        webScreen: WebResetPass(),
      );
  }
}


