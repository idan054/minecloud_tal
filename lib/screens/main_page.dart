import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import '../common/theme/colors.dart';
import '../widgets/worldCardWs.dart';

class MainPage extends StatefulWidget {
  final bool isLocalPage;
  final bool isShowPack;
  const MainPage({
    required this.isLocalPage,
    required this.isShowPack,
    Key? key}) : super(key: key);

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
                return
                  worldPackTile(widget.isShowPack);

              },
            ),
          ),
        ));
  }


}
