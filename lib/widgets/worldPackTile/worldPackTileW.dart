import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/functions/webpopups/deletedailog.dart';

import '../../common/theme/colors.dart';
import '../../common/theme/text.dart';
import '../../functions/bottomSheetW.dart';
import '../../functions/webpopups/webdefaultdialog.dart';
import 'leading_image.dart';

Widget worldPackTile(
  context, {
  required bool isPack,
  required BottomSheetType bottomSheetType,
  required String title,
  bool? isLocalpage,
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
        print(maxWidth(context));
        if (maxWidth(context) < 1000) {
          showMyBottomSheet(context,
              title: title, isPack: isPack, bottomSheetType: bottomSheetType);
        }
        if (maxWidth(context) >= 1000) {
          showWebDialog(
              context: context,
              isPack: isPack,
              title: title,
              okayTap: () {},
              isLocal: isLocalpage,
              OkayBtn: isLocalpage! ? 'Download' : 'Upload',
              cancelBtn: 'Delete',
              cancelTap: () {
                Navigator.of(context).pop();
                showDeleteDialog(
                    context: context, isPack: isPack, title: title);
              });
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
