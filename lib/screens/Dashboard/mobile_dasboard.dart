import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/common/widgets/common_choice_chip.dart';
import 'package:minecloud_tal/functions/bottomSheetW.dart';
import 'package:minecloud_tal/functions/loadingDialogW.dart';
import 'package:minecloud_tal/screens/Pageviewer/mainpage.dart';
import 'package:minecloud_tal/widgets/cleanAppBarW.dart';
import 'package:minecloud_tal/widgets/drawerW.dart';
import 'package:minecloud_tal/widgets/simpleWs.dart';

class MobileDashboard extends StatefulWidget {
  final List<String> chips;

  const MobileDashboard({Key? key, required this.chips}) : super(key: key);

  @override
  State<MobileDashboard> createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  int _selectedIndex = 0;
  int _chipIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
        backgroundColor: kEmptyColor,
        appBar: buildChipAppBar(),
        drawer: const DrawerW(),
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            MainPage(isPackView: _chipIndex == 0),
            MainPage(isLocalPage: false, isPackView: _chipIndex == 0),
          ],
          physics: const NeverScrollableScrollPhysics(), // disable swipe
          onPageChanged: (pageIndex) {
            if (_selectedIndex == 1) {
              showLoaderDialog(context);
              Future.delayed(
                  const Duration(milliseconds: 1250),
                  () => kNavigator(context).pop(),
                );
              }
            setState(() => _selectedIndex = pageIndex);
          },
        ),
        floatingActionButton: buildFab(),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildBottomNavigationBar(),
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
        onPressed: () => showMyBottomSheet(
          context,
          title: 'Synchronize',
          bottomSheetType: BottomSheetType.syncHome,
        ),
        child: Container(
          width: 60,
          height: 60,
          child: const Icon(Icons.sync_outlined),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: positiveBlueButtonGradient,
          ),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: kTapBorderAssets,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kImportantWhite80,
      unselectedItemColor: kDetailedWhite60,
      selectedLabelStyle: poppinsRegular().copyWith(color: kImportantWhite80),
      unselectedLabelStyle: poppinsRegular().copyWith(color: kDetailedWhite60),
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
          debugPrint('_selectedIndex $_selectedIndex');
          _pageController.jumpToPage(value);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: _selectedIndex == 0
              ? buildContainer(
                  color: kDetailedWhite60,
                  icon: Icons.folder_rounded,
                )
              : buildContainer(
                  color: kEmptyColor,
                  icon: Icons.folder_open_rounded,
                ),
          label: 'Local',
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 1
              ? buildContainer(
                  color: kTapBorderAssets,
                  icon: Icons.cloud_rounded,
                )
              : buildContainer(
                  color: kEmptyColor,
                  icon: Icons.cloud_off_outlined,
                ),
          label: 'Cloud',
        ),
      ],
    );
  }

  Container buildContainer({required Color color, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: kDetailedWhite60, size: 20),
    );
  }

  AppBar buildChipAppBar() {
    return cleanAppBar(
      context,
      _selectedIndex == 0 ? 'Local Data' : 'Cloud Storage',
      chipsW: PreferredSize(
        preferredSize: const Size(9999, 50),
        child: Column(
          children: [
            lightDivider(),
            SizedBox(
              height: 70,
              child: ListView.builder(
                itemCount: widget.chips.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CommonChoiceChip(
                      text: widget.chips[index],
                      onSelected: (bool selected) {
                        setState(() {
                          _chipIndex = selected ? index : 0;
                        });
                      },
                      index: index,
                      chipIndex: _chipIndex,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
