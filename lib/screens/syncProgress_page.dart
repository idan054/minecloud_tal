import 'dart:math';
import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/functions/bottomSheetW.dart';
import 'package:minecloud_tal/widgets/cleanAppBarW.dart';
import 'package:minecloud_tal/widgets/drawerW.dart';
import 'package:minecloud_tal/widgets/worldPackTile/worldPackTileW.dart';

class SyncProgressPage extends StatefulWidget {
  const SyncProgressPage({Key? key}) : super(key: key);

  @override
  State<SyncProgressPage> createState() => _SyncProgressPageState();
}

class _SyncProgressPageState extends State<SyncProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(gradient: darkBackgroundGradient),
        child: Scaffold(
          backgroundColor: kEmptyColor,
          drawer: const DrawerW(isSyncPage: true),
          appBar: cleanAppBar(context, 'Sync Progress'),
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                bool isPack = Random().nextDouble() <= 0.50;  // 50% chance.
                return worldPackTile(context,
                  isPack: isPack,
                  bottomSheetType: BottomSheetType.unSyncPage,
                  title: "Clear Vanilla",
                  image: 'PlaceHolder',);
              },
            ),
          ),
        ));
  }
}
