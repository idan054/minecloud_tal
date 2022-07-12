import 'package:flutter/material.dart';

import '../../common/theme/colors.dart';
import '../../common/theme/text.dart';

// On login_page.dart
Column buildBottomSignup() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Divider(color: kTapBorderAssets,
        // thickness: 1,
        indent: 20,
        endIndent: 20,),
      const SizedBox(height: 10,),
      InkWell(
        splashColor: kDetailedWhite60,
        onTap: (){},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account? ",
                style: poppinsRegular()),
            Text('Sign Up.', style: poppinsMedium()
                .copyWith(fontSize: 11,
                fontWeight: FontWeight.bold
            )),
          ],),
      )
    ],
  );
}