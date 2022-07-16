import 'package:flutter/material.dart';
import '../common/theme/colors.dart';
import '../common/theme/constants.dart';
import '../common/theme/text.dart';
import '../widgets/actionTileWs.dart';
import '../widgets/buttonsWs.dart';
import 'bottomSheetW.dart';

Future<void> accountDialog(
  BuildContext context, {
  // Widget title = const Offstage(),
  // Widget content = const Offstage(),
  String? mainTxtButton,
  VoidCallback? mainPressed,
  String? secondaryTxtButton,
  VoidCallback? secondaryPressed,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    // barrierColor: Colors.black26,
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
              // buildTopTitle(context, null, '$title', null),
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

              // todo change to listView.builder based AccountInfoTile() Widget
              Card(
                color: kTapBorderAssets,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundColor: kTapBorderAssets,
                  ),
                  onTap: () {},
                  title: Text(
                    'Cloud Storage',
                    style: poppinsMedium()
                        .copyWith(color: kImportantWhite80, fontSize: 12),
                  ),
                  // todo show User email here
                  subtitle: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ClipRRect(
                          borderRadius:  BorderRadius.circular(99),
                          child: const  LinearProgressIndicator(
                            value: 0.6,
                            color: kLoadingGrey,
                            backgroundColor: kProgressBar,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text('58.91 MB used',
                              style: poppinsRegular().copyWith(
                                  fontSize: 11, color: kDetailedWhite60)),
                          const Spacer(),
                          Text('of 500 MB',
                              style: poppinsRegular().copyWith(
                                  fontSize: 11, color: kDetailedWhite60)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 85),
                  if (secondaryTxtButton != null)
                    Expanded(
                        child: secondaryIconButton(
                            text: secondaryTxtButton,
                            onPressed: secondaryPressed,
                            miniMode: true)),
                  Expanded(
                      child: secondaryIconButton(
                          text: '$mainTxtButton',
                          miniMode: true,
                          buttonColor: kLoadingGrey,
                          onPressed: mainPressed)),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ));
    },
  );
}
