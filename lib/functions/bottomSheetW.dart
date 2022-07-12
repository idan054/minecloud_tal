import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';

import '../widgets/worldPackTile/leading_image.dart';

class SetBottomSheet{
  final bool isWorld;
  final String title;
  final String image;
  final IconData action1Icon;
  final String action1text;
  final IconData action2Icon;
  final String action2text;

  SetBottomSheet(
  {
    required this.isWorld,
    required this.title,
    required this.image,
    required this.action1Icon,
    required this.action1text,
    required this.action2Icon,
    required this.action2text, 
  });
}

Future<void> showMyBottomSheet(
    context, SetBottomSheet set) async {

  Widget circleIcon({IconData? icon, bool closeButton = false}) {
    return CircleAvatar(
        radius: closeButton ? 15 : 20,
        backgroundColor: kTapBorderAssets,
        foregroundColor: kDetailedWhite60,
        child: Icon(closeButton ? Icons.close : icon));
  }

  Widget actionTile(IconData icon, String text) {
    return
      ListTile(
        leading: circleIcon(icon: icon),
        title: Text(
        text,
        style: poppinsRegular().copyWith(fontSize: 11),
      ),
    onTap: () {},
    );
  }

  return showModalBottomSheet(
      context: context,
      backgroundColor: kEmptyColor,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xff172F43),
              // gradient: darkBackgroundGradient
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
              )

          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ListTile(
                leading: buildLeadingImage(set.isWorld, 60, set.image),
                trailing: circleIcon(closeButton: true),
                title: Text(
                  set.title,
                  style: poppinsMedium().copyWith(fontSize: 13),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: lightDivider(),
              ),
              actionTile(set.action1Icon, set.action1text),
              actionTile(set.action2Icon, set.action2text),
              const SizedBox(height: 15)
            ],
          ),
        );
      });
}
