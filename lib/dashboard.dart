import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/screens/main_page.dart';
import 'package:minecloud_tal/widgets/cleanAppBarW.dart';
import 'package:minecloud_tal/widgets/drawerW.dart';
import 'package:minecloud_tal/widgets/simpleWs.dart';

import 'common/theme/colors.dart';
import 'common/theme/text.dart';
import 'functions/bottomSheetW.dart';
import 'functions/deleteDialogW.dart';
import 'functions/loadingDialogW.dart';
import 'functions/accountDialog.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // chips variables
  final List<String> _chips =
  ['Worlds', 'Resources Packs', 'Behavior Packs', 'Skin Packs'];
  int _chipIndex = 0;

  int w = 0;

  @override
  Widget build(BuildContext context) {

    // todo: Show permission dialog & make it work
    // universalDialog(context,
    //     title: 'One more step...',
    //     desc: 'We need a required permission of "Files and media". Make sure to allow management of all files.',
    //     mainTxtButton: 'Go to settings',
    //     mainPressed: () => kNavigator(context).pop()
    // );

    return Container(
      decoration: BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
        backgroundColor: kEmptyColor,
        appBar: buildChipAppBar(),
        drawer: DrawerW(),
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            MainPage(isLocalPage: true,
                isPackView: _chipIndex == 0),
            MainPage(isLocalPage: false,
                isPackView: _chipIndex == 0),
          ],
          physics: const NeverScrollableScrollPhysics(), // disable swipe
          onPageChanged: (pageIndex) { // On Swipe left or right

            if(_selectedIndex == 1) {
              showLoaderDialog(context, 'Loading your data...');
              Future.delayed(const Duration(milliseconds: 1250),
                  () => kNavigator(context).pop());
            }
            setState(() => _selectedIndex = pageIndex);
          },
        ),
        floatingActionButton: buildFab(),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
        buildBottomNavy(),
      ),
    );
  }

  Container buildFab() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton(
        elevation: 0,
        mini: true,
        onPressed: () {
          showMyBottomSheet(context,
            title: 'Synchronize',
            bottomSheetType: BottomSheetType.syncHome
          );
        },
        child: Container(
          width: 60,
          height: 60,
          child: const Icon(Icons.sync_outlined),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: positiveBlueButtonGradient),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavy() {
    return BottomNavigationBar(
      backgroundColor: kTapBorderAssets,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kImportantWhite80,
      unselectedItemColor: kDetailedWhite60,
      selectedLabelStyle:
      poppinsRegular().copyWith(color: kImportantWhite80),
      unselectedLabelStyle:
      poppinsRegular().copyWith(color: kDetailedWhite60),
      currentIndex: _selectedIndex,
      onTap: (value) {
        // onTap Bottom icon
        setState((){
        _selectedIndex = value;
        print('_selectedIndex $_selectedIndex');
        _pageController.jumpToPage(value);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _selectedIndex == 0
                ? Container(
                padding:
                EdgeInsets.symmetric(horizontal: 22, vertical: 4),
                color: kTapBorderAssets,
                child: Icon(
                  Icons.folder_rounded,
                  color: kDetailedWhite60,
                  size: 20,
                ))
                : Container(
                padding:
                EdgeInsets.symmetric(horizontal: 22, vertical: 4),
                color: kEmptyColor,
                child: Icon(
                  Icons.folder_open_rounded,
                  color: kDetailedWhite60,
                  size: 20,
                )),
          ),
          label: 'Local',
        ),
        BottomNavigationBarItem(
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _selectedIndex == 1
                ? Container(
                padding:
                EdgeInsets.symmetric(horizontal: 22, vertical: 4),
                color: kTapBorderAssets,
                child: Icon(
                  Icons.cloud_rounded,
                  color: kDetailedWhite60,
                  size: 20,
                ))
                : Container(
                padding:
                EdgeInsets.symmetric(horizontal: 22, vertical: 4),
                color: kEmptyColor,
                child: Icon(
                  Icons.cloud_outlined,
                  color: kDetailedWhite60,
                  size: 20,
                )),
          ),
          label: 'Cloud',
        ),
      ],
    );
  }
  AppBar buildChipAppBar() {
    return cleanAppBar(
        context,
        _selectedIndex == 0 ? 'Local Data' : 'Cloud Storage',
        chipsW: PreferredSize(
          preferredSize: Size(9999, 50),
          child: Column(
            children: [
              lightDivider(),
              SizedBox(
                height: 70,
                child: ListView.builder(
                    itemCount: _chips.length,
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: ChoiceChip(
                            label: Text(_chips[index]),
                            selected: _chipIndex == index,
                            selectedColor: Color(0xff1E76DE),
                            onSelected: (bool selected) {
                              setState(() {
                                _chipIndex = selected ? index : 0;
                              });
                            },
                            backgroundColor: kTapBorderAssetsFull,
                            shape: StadiumBorder(
                                side: BorderSide(
                                  width: 1.5,
                                  color:
                                  index == _chipIndex ?
                                  Color(0xff1E76DE) : kTapBorderAssets,
                                )),
                            labelStyle: poppinsRegular().copyWith(fontSize: 12),
                          ),
                        );
                    }),
              )
            ],
          ),
        )
    );
  }
}
