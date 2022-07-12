import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/functions/bottomSheetW.dart';
import '../common/theme/colors.dart';
import '../widgets/worldPackTile/worldPackTileW.dart';

class MainPage extends StatefulWidget {
  final bool isLocalPage;
  final bool isPackView;

  const MainPage(
      {required this.isLocalPage, required this.isPackView, Key? key})
      : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(gradient: darkBackgroundGradient),
        child: Scaffold(
          backgroundColor: kEmptyColor,
          drawer: const Drawer(),
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return worldPackTile(context,
                    isPack: widget.isPackView,
                    setBottomSheet: SetBottomSheet(
                      isWorld: widget.isPackView,
                      title: "Tal's World",
                      image: 'PlaceHolder',
                      action1Icon: Icons.cloud_upload,
                      action2Icon: Icons.delete_outline,
                      action1text: 'Upload to cloud',
                      action2text: 'Delete locally',
                    ));
              },
            ),
          ),
        ));
  }
}
