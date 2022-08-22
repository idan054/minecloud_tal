import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/constants.dart';

import '../../common/theme/colors.dart';
import '../../common/theme/text.dart';
import '../../widgets/buttonsWs.dart';
import '../bottomSheetW.dart';

Future<void> showWebDialog({
  required BuildContext context,
   required bool isPack,
   bool? isLocal,
  required String title,
  String? image,
  required String OkayBtn,
  Function()? okayTap,
  required String cancelBtn,
  Function()? cancelTap,
  
}) async {
  String? desc;
  if (isLocal!) {
    // when synced
    desc =
        'You\'ve selected one of your local worlds.What would you like to do?';
  } else {
    desc =
        "You've selected one of your worlds on the cloud.What would you like to do?";
  }

  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: darkBg,
          contentPadding: EdgeInsets.zero,
          content: Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
            // height: maxHeight(context) * 0.25,
            width: maxWidth(context) * 0.25,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTopTitle(context,
                    title: title, image: image),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text('$desc',
                      style:
                          poppinsRegular().copyWith(color: kDetailedWhite60,fontSize: 13)),
                ),
                 SizedBox(height: maxHeight(context)*0.05),
                Row(
                  children: [
                    // const SizedBox(width: 85),
                    Expanded(
                        child:
                            DialogButton(text: cancelBtn,btncolor: kTapBorderAssets,onPressed: cancelTap,),),
                    Expanded(
                      child: DialogButton(text:OkayBtn,btncolor: kLoadingGrey,onPressed: (){},),
                        ),
                   
                  ],
                ),
               
              ],
            ),
          ));
    },
  );
}

class DialogButton extends StatelessWidget {
  DialogButton({
    required this.text,
    required this.btncolor,
    required this.onPressed,
  });
  String text;
  Color btncolor;
  Function()? onPressed;
  
  @override
  Widget build(BuildContext context) {
    Color buttonColor = btncolor;
  Color textColor = kPositiveWhite;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(buttonColor),
            minimumSize: MaterialStateProperty.all(const Size(999, 45)),
            // padding:EdgeInsets.symmetric(horizontal: 5),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(color: kSecondaryButton, width: 2),
                borderRadius: BorderRadius.circular(10), // <-- Radius
              ),
            )),
        icon: const Icon(Icons.hide_image, size: 0),
        label: Text(
          text,
          style: poppinsMedium().copyWith(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
