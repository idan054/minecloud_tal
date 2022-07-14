import 'package:flutter/material.dart';

import '../common/theme/colors.dart';
import '../common/theme/text.dart';
import '../widgets/buttonsWs.dart';
import 'bottomSheetW.dart';

Future<void> showDeleteDialog(
  BuildContext context,
  bool isPack,
  BottomSheetType bottomSheetType,
  String? image,
) async {
  String? desc;
  if (bottomSheetType == BottomSheetType.local) {
    // when synced
    desc =
        'It will be deleted locally, but not from the cloud or from other registered devices.';
  }
  // when un synced
  // desc = """It will be deleted permanently, and you won't be able to restore this world. """;}
  if (bottomSheetType == BottomSheetType.cloud) {
    desc =
        """It will be deleted from the cloud, but not locally. So you'll still be able to access and play it.""";
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
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTopTitle(context, isPack,
                  isPack ? 'Delete this pack?' : 'Delete this world?', image),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text('$desc',
                    style: poppinsRegular().copyWith(color: kDetailedWhite60)),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  const SizedBox(width: 85),
                  Expanded(
                      child:
                          secondaryIconButton(text: 'Delete ',
                              miniMode: true)),
                  Expanded(
                      child:
                          secondaryIconButton(text: 'Cancel ',
                              miniMode: true, buttonColor: kLoadingGrey)),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ));
    },
  );
}
