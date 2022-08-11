import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/functions/bottomSheetW.dart';
import 'package:minecloud_tal/common/widgets/common_show_dialog.dart';
import 'leading_image.dart';

Widget worldPackTile(
  context, {
  required bool isPack,
  required BottomSheetType bottomSheetType,
  required String title,
  bool? isLocalPage,
  required String image,
}) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // <-- Radius
    ),
    color: kTapBorderAssets,
    child: ListTile(
      onTap: () {
        if (maxWidth(context) < 1000) {
          showMyBottomSheet(context,
              title: title, isPack: isPack, bottomSheetType: bottomSheetType);
        }
        if (maxWidth(context) >= 1000) {
          commonShowDialog(
              context: context,
              title: title,
              buttonTitle: isLocalPage! ? 'Download' : 'Upload',
              onTap: () {},
              cancelTitle: 'Delete',
              cancelOnTap: () {
                Navigator.of(context).pop();
                commonShowDialog(
                    context: context,
                    title: title,
                    buttonTitle: 'Delete',
                    desc:
                        "It will be deleted locally, but not from the cloud or from other registered devices.");
              },
              desc:
                  'You\'ve selected one of your local worlds.What would you like to do?');
        }
      },
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 6,
      ),
      dense: true,
      leading: buildLeadingImage(isPack, 90, 'PlaceHolder'),
      title: Text(
        'Clear Vanilla',
        style: poppinsRegular().copyWith(fontSize: 13),
      ),
      subtitle: Text(
        '21:08 - 21.3 MB',
        style: poppinsRegular().copyWith(fontSize: 10, color: kDetailedWhite60),
      ),
      trailing: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            child: Container(
              color: kTapBorderAssets,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: Text('SYNCED',
                  style: poppinsRegular().copyWith(
                    fontSize: 10,
                    color: kDetailedWhite60,
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}
