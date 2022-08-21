import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/common/widgets/common_choice_chip.dart';
import 'package:minecloud_tal/functions/loadingDialogW.dart';
import 'package:minecloud_tal/functions/popup.dart';
import 'package:minecloud_tal/common/widgets/common_show_dialog.dart';
import 'package:minecloud_tal/screens/Pageviewer/mainpage.dart';
import 'package:minecloud_tal/screens/Pageviewer/standardplan.dart';
import 'package:minecloud_tal/widgets/sidebar.dart';
import 'filtersWebBar.dart';

class WebDashBoard extends StatefulWidget {
  final List<String> chips;

  const WebDashBoard({Key? key, required this.chips}) : super(key: key);

  @override
  State<WebDashBoard> createState() => _WebDashBoardState();
}

class _WebDashBoardState extends State<WebDashBoard> {
  int _chipIndex = 0;
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  List<Map<String, dynamic>> appBarMap = [
    {'title': 'Local data', 'subTitle' : 'Your playable Minecraft assets, stored on this device.'},
    {'title': 'Cloud data', 'subTitle' : 'Your playable Minecraft assets, stored on this device.'},
    {'title': 'Sync Process', 'subTitle' : 'Progress of cloud tasks, such as upload & download.'},
    {'title': 'Standard Plan', 'subTitle' : 'Your Plan and account details'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkBackgroundGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: SideBar(
                selectedIndex: _selectedIndex,
                onChanged: (value) {
                  setState(() {
                    _selectedIndex = value;
                    debugPrint('_selectedIndex $_selectedIndex');
                    _pageController.jumpToPage(value);
                  });
                },
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 70),
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WebAppbar(
                      title: appBarMap[_selectedIndex]['title'],
                      subTitle: appBarMap[_selectedIndex]['subTitle'],
                      onChanged: (value){},
                    ),
                    SizedBox(height: maxHeight(context) * 0.03),
                    if (_selectedIndex != 3 && _selectedIndex != 2)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: SizedBox(
                              height: maxHeight(context) * 0.04,
                              child: ListView.builder(
                                itemCount: widget.chips.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 10),
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
                            ),
                          ),
                          FiltersWebBar()
                        ],
                      ),
                    SizedBox(height: maxHeight(context) * 0.02),
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        children: <Widget>[
                          MainPage(isPackView: _chipIndex == 0),
                          MainPage(isLocalPage: false, isPackView: _chipIndex == 0),
                          MainPage(isPackView: _chipIndex == 0),
                          const MyPlanScreen(),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebAppbar extends StatefulWidget {
  const WebAppbar({
    required this.title,
    required this.subTitle,
    required this.onChanged,
    Key? key,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final Function onChanged;

  @override
  State<WebAppbar> createState() => _WebAppbarState();
}

class _WebAppbarState extends State<WebAppbar> {
  bool showProfileOption = false;
  bool isSync = false;
  bool isExpanded = false;

  PopupMenuItem buildListTile(
      {required IconData leadingIcon,
      IconData? trailing,
      required String title,
      required String subTitle,
      required Function()? onTap}) {
    return PopupMenuItem(
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Icon(
            leadingIcon,
            color: Colors.white,
            size: 20,
          ),
          title: Text(
            title,
            style: poppinsMedium().copyWith(fontWeight: FontWeight.w300, fontSize: 13),
          ),
          subtitle: Text(
            subTitle,
            style: poppinsRegular().copyWith(
              color: Colors.white.withOpacity(0.5),
              fontSize: 10,
            ),
          ),
          trailing: Icon(trailing, size: 20, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 9,
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            Stack(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(),
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          isSync
                              ? showPopupMenu(popups: [
                                  buildListTile(
                                      leadingIcon: Icons.stop,
                                      title: 'Stop Sync',
                                      subTitle: '',
                                      onTap: () {
                                        setState(() {
                                          isSync = false;
                                        });
                                        Navigator.of(context).pop();
                                      }),
                                  buildListTile(
                                      leadingIcon: Icons.playlist_add_check,
                                      title: 'Show Progress',
                                      subTitle:
                                          'Present all current cloud tasks',
                                      onTap: () {}),
                                ], context: context)
                              : showPopupMenu(popups: [
                                  buildListTile(
                                      leadingIcon: Icons.sync_outlined,
                                      title: 'Sync',
                                      subTitle:
                                          'Sync your assets without launching Minecraft',
                                      onTap: () {
                                        setState(() {
                                          isSync = true;
                                        });
                                        Navigator.of(context).pop();
                                      }),
                                  buildListTile(
                                      leadingIcon:
                                          Icons.rocket_launch_outlined,
                                      title: 'Sync & Launch',
                                      subTitle:
                                          'Launch Minecraft automatically after the sync',
                                      onTap: () {}),
                                ], context: context);
                        },
                        icon: const Icon(Icons.sync_outlined,
                            color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(47, 47),
                          maximumSize: const Size(100, 47),
                        ),
                        label: Text(isSync ? 'Syncing...' : 'Sync'),
                      ),
                    ),
                    SizedBox(
                      width: maxWidth(context) * 0.01,
                    ),
                    InkWell(
                      onTap: () {
                        setState(
                          () {
                            showPopupMenu(
                              context: context,
                              popups: [
                                buildListTile(
                                  leadingIcon: Icons.person_outline,
                                  title: 'Plan Details',
                                  subTitle: 'View Your Plan and Account Details',
                                  onTap: () {},
                                ),
                                buildListTile(
                                  leadingIcon: Icons.desktop_windows,
                                  title: 'Manage Devices',
                                  subTitle: 'Manage your connected devices',
                                  trailing: Icons.launch,
                                  onTap: () {},
                                ),
                                buildListTile(
                                  leadingIcon: Icons.logout_outlined,
                                  title: 'Logout',
                                  subTitle: 'Logout from Minecloud',
                                  onTap: () {
                                    commonShowDialog(
                                      context: context,
                                      title: 'Logout',
                                      desc: 'Remember my info?',
                                      isCheckBox: true,
                                      buttonTitle: 'Logout',
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 43,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          gradient: darkPopupGradient,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: kDialogBg,
                                  radius: 16,
                                  child: Text('T'),
                                ),
                                SizedBox(width: maxWidth(context) * 0.005),
                                Text("tallme20@gmail.com", style: poppinsRegular()),
                                SizedBox(width: maxWidth(context) * 0.005),
                                const Icon(
                                  Icons.expand_more,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: maxHeight(context) * 0.01),
        Text(
          widget.subTitle,
          style: poppinsRegular().copyWith(color: Colors.white.withOpacity(0.5)),
        ),
      ],
    );
  }
}
