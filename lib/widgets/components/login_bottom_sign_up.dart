import 'package:flutter/material.dart';

import '../../common/theme/colors.dart';
import '../../common/theme/text.dart';

// On login_page.dart
Column bottomDividerTxtBtn(endText,
    {String startText = 'Don\'t have an account?', VoidCallback? onTap, bool showDivider = true}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      if(showDivider)...[
      const Divider(
        color: kTapBorderAssets,
        indent: 20,
        endIndent: 20,
      ),
      const SizedBox(
        height: 10,
      )],
      InkWell(
        splashColor: kDetailedWhite60,
        onTap: onTap ?? () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(startText, style: poppinsRegular()),
            Text(endText,
                style: poppinsMedium()
                    .copyWith(fontSize: 11, fontWeight: FontWeight.bold)),
          ],
        ),
      )
    ],
  );
}
