import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import '../common/theme/colors.dart';

class LocalHomePage extends StatefulWidget {
  const LocalHomePage({Key? key}) : super(key: key);

  @override
  State<LocalHomePage> createState() => _LocalHomePageState();
}

class _LocalHomePageState extends State<LocalHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(gradient: darkBackgroundGradient),
        child: Scaffold(
          backgroundColor: kEmptyColor,
          drawer: Drawer(),
          appBar: AppBar(

            centerTitle: true,
            backgroundColor: kTapBorderAssets,
            title: Text('Local Data', style: poppinsMedium(),),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: kTapBorderAssets,),
            )],
            toolbarHeight: 120, //
            // bottom: Container(
            //   color: kTapBorderAssets,
            //   child: Divider()
            // ),
          ),
        ));
  }
}
