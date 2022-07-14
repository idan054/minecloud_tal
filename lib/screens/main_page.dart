import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/functions/bottomSheetW.dart';
import '../common/theme/colors.dart';
import '../widgets/drawerW.dart';
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
  String sortBy = 'Name';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(gradient: darkBackgroundGradient),
        child: Scaffold(
          backgroundColor: kEmptyColor,
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: (){
                      showMyBottomSheet(context,
                          title: 'Sort by',
                          bottomSheetType: BottomSheetType.sortBy
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12,8,12,8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(kUniModel(context, listen: true).sortBy, style: poppinsRegular().copyWith(color: kDetailedWhite60),),
                          const SizedBox(width: 8),
                          Icon(Icons.south, color: kDetailedWhite60, size: 14),
                        ],
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    // todo show List of worlds\ packs from local & cloud.
                    return worldPackTile(
                      context,
                      isPack: widget.isPackView,
                      bottomSheetType: widget.isLocalPage
                          ? BottomSheetType.local
                          : BottomSheetType.cloud,
                      title: "Clear Vanilla",
                      image: 'PlaceHolder',
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
