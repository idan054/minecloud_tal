
import 'package:flutter/material.dart';
import 'package:minecloud_tal/functions/bottomSheetW.dart';
import '../../common/theme/colors.dart';
import '../../widgets/worldPackTile/worldPackTileW.dart';


class WebMainPage extends StatefulWidget {
  final bool isLocalPage;
  final bool isPackView;

  WebMainPage({required this.isLocalPage, required this.isPackView, Key? key})
      : super(key: key);

  @override
  State<WebMainPage> createState() => _WebMainPageState();
}

class _WebMainPageState extends State<WebMainPage> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
        child: Scaffold(
          backgroundColor: kEmptyColor,
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
             
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    // todo show List of worlds\ packs from local & cloud.
                    return worldPackTile(
                      context,
                      isPack: widget.isPackView,
                      isLocalpage:widget.isLocalPage,
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