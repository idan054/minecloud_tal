import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/common/widgets/common_show_dialog.dart';
import 'package:minecloud_tal/functions/snackbarW.dart';
import 'package:minecloud_tal/widgets/actionTileWs.dart';
import 'package:minecloud_tal/widgets/radioButtonsW.dart';
import 'package:minecloud_tal/widgets/simpleWs.dart';
import 'package:minecloud_tal/widgets/worldPackTile/leading_image.dart';

enum BottomSheetType {
  local,
  cloud,
  sortBy,
  syncHome, // when on home page
  unSyncHome, // when on home page
  unSyncPage, // when on sync page
}

Future<void> showMyBottomSheet(
    scaffoldContext, {
  bool? isPack,
  required BottomSheetType bottomSheetType,
  required String title,
  String? image,
}) async {

  return showModalBottomSheet(
      context: scaffoldContext,
      backgroundColor: kEmptyColor,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              color: Color(0xff172F43),
              // gradient: darkBackgroundGradient
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildTopTitle(context,
                  isPack: isPack,
                  title: title,
                  image: image),
              if (bottomSheetType == BottomSheetType.local) ...[
                // todo upload local world to GCloud
                actionTile(Icons.cloud_upload_outlined, 'Upload to cloud'),
                // todo delete world from local
                actionTile(Icons.delete_outline, 'Delete locally',
                    onTap: () => commonShowDialog(
                        context: context,
                        desc:
                            'It will be deleted locally, but not from the cloud or from other registered devices.',
                        buttonTitle: isPack!
                            ? 'Delete this pack?'
                            : 'Delete this world?',
                        image: image)),
              ],
              if (bottomSheetType == BottomSheetType.cloud) ...[
                // todo download local world to GCloud
                actionTile(Icons.cloud_download_outlined, 'Download'),
                // todo delete world from GCloud
                actionTile(
                  Icons.delete_outline,
                  'Delete from cloud',
                  onTap: () => commonShowDialog(
                      context: context,
                      desc:
                          "It will be deleted from the cloud, but not locally. So you'll still be able to access and play it.",
                      buttonTitle:
                          isPack! ? 'Delete this pack?' : 'Delete this world?',
                      image: image),
                )
              ],
              if (bottomSheetType == BottomSheetType.syncHome) ...[
                // todo SYNC - get list of files in local & cloud & compare
                actionTile(Icons.sync_outlined, 'Sync',
                onTap: () {
                  kNavigator(context).pop();
                  showMySnackBar(scaffoldContext, () => kNavigator(context).pop(),);
                }),
                //  todo SYNC then Run Minecraft
                actionTile(Icons.rocket_launch_outlined, 'Sync & Launch',
                    subTitle: 'Launch Minecraft automatically after the sync.'),
              ],
              if (bottomSheetType == BottomSheetType.unSyncHome) ...[
                actionTile(Icons.stop, 'Stop sync'),
                actionTile(Icons.playlist_add_check_outlined, 'Show progress',
                    subTitle: 'Present all cloud tasks.'),
              ],
              if (bottomSheetType == BottomSheetType.unSyncPage) ...[
                actionTile(Icons.stop, 'Stop sync'),
              ],

              if (bottomSheetType == BottomSheetType.sortBy) ...[
                const RadioButtons()
              ],

              const SizedBox(height: 15)
            ],
          ),
        );
      });
}

Column buildTopTitle(
    BuildContext context,
    {
    bool? isPack,
    String? title,
    String? image,
      Widget? customTitle,
      bool showDivider = true,
    }) {
  return Column(
              children: [
                ListTile(
                  leading: isPack != null ? buildLeadingImage(isPack, 60, image) : null,
                  trailing: circleIcon(closeButton: true),
                  title: title != null && customTitle == null ? Text(
                    title,
                    style: poppinsMedium().copyWith(fontSize: 16),
                  ) : customTitle,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              if(showDivider)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: lightDivider(),
                  ),
            ],
          );
}
