import 'package:flutter/material.dart';

import '../../common/theme/colors.dart';
import '../../common/theme/text.dart';
import '../../functions/bottomSheetW.dart';
import 'leading_image.dart';

Widget worldPackTile(context, {
      required bool isPack,
      required SetBottomSheet setBottomSheet}) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // <-- Radius
    ),
    color: kTapBorderAssets,
    child: ListTile(
      onTap: () => showMyBottomSheet(context, setBottomSheet),
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
