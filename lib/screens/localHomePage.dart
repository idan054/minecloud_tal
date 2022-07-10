import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import '../common/theme/colors.dart';

class LocalHomePage extends StatefulWidget {
  const LocalHomePage({Key? key}) : super(key: key);

  @override
  State<LocalHomePage> createState() => _LocalHomePageState();
}

class _LocalHomePageState extends State<LocalHomePage> {
  int _selectedIndex = 0;

  // final PageController _pageController = PageController();

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
            title: Text(
              'Local Data',
              style: poppinsMedium(),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: kTapBorderAssets,
                ),
              )
            ],
            toolbarHeight: 120, //
            // bottom: Container(
            //   color: kTapBorderAssets,
            //   child: Divider()
            // ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  color: kTapBorderAssets,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    dense: true,
                    leading: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      child: Container(
                        height: 90 * 0.6,
                        width: 90,
                        color: kTapBorderAssets,
                        child: Image.network(
                          'https://static.wikia.nocookie.net/minecraft_gamepedia/images/4/47/Glacier_b1.7.3.png/revision/latest?cb=20200607182238',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      'Clear Vanilla',
                      style: poppinsRegular().copyWith(fontSize: 13),
                    ),
                    subtitle: Text(
                      '21:08 - 21.3 MB',
                      style: poppinsRegular()
                          .copyWith(fontSize: 10, color: kDetailedWhite60),
                    ),
                    trailing: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          child: Container(
                            color: kTapBorderAssets,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            child: Text('SYNCED',
                                style: poppinsRegular().copyWith(
                                  fontSize: 10,
                                  color: kDetailedWhite60,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 5),
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {},
              child: Container(
                width: 60,
                height: 60,
                child: const Icon(Icons.sync_outlined),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: positiveBlueButtonGradient
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: kProgressBar,
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
              setState(() => _selectedIndex = value);
              print('_selectedIndex $_selectedIndex');
              // _pageController.jumpToPage(value);
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
          ),
        ));
  }
}
