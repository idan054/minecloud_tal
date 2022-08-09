import 'package:flutter/material.dart';
import 'package:minecloud_tal/functions/webpopups/logoutdailog.dart';
import 'package:minecloud_tal/functions/webpopups/webdefaultdialog.dart';
import 'package:minecloud_tal/screens/Dashboard/dashboard.dart';
import 'package:minecloud_tal/widgets/dropdown.dart';
import 'package:minecloud_tal/widgets/popup_menu.dart';
import 'package:minecloud_tal/widgets/sidebar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/theme/colors.dart';
import '../../common/theme/constants.dart';
import '../../common/theme/text.dart';
import '../../functions/loadingDialogW.dart';
import '../../functions/popup.dart';
import '../../widgets/actionTileWs.dart';
import '../../widgets/buttonsWs.dart';
import '../../widgets/simpleWs.dart';
import '../Pageviewer/mainpage.dart';
import '../Pageviewer/standardplan.dart';
import '../plans/plans.dart';
import '../syncProgress_page.dart';
import 'filtersWebBar.dart';

class WebDashBoard extends StatefulWidget {
  const WebDashBoard({Key? key}) : super(key: key);

  @override
  State<WebDashBoard> createState() => _WebDashBoardState();
}

class _WebDashBoardState extends State<WebDashBoard> {
  final List<String> _chips = [
    'Worlds',
    'Resources Packs',
    'Behavior Packs',
    'Skin Packs'
  ];
  int _chipIndex = 0;
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

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
              child: Container(
                  child: SideBar(
                selectedIndex: _selectedIndex,
                onChanged: (value) {
                  setState(() {
                    _selectedIndex = value;
                    print('_selectedIndex $_selectedIndex');
                    _pageController.jumpToPage(value);
                  });
                },
              )),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 70),
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        if (_selectedIndex == 0)
                          WebAppbar(
                            title: 'Local Data',
                            subTitle:
                                'Your playable Minecraft assets, stored on this device.',
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        if (_selectedIndex == 1)
                          WebAppbar(
                            title: 'Cloud Data',
                            subTitle:
                                'Your playable Minecraft assets, stored on this device.',
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        if (_selectedIndex == 2)
                          WebAppbar(
                            title: 'Sync Process',
                            subTitle:
                                'Progress of cloud tasks, such as upload & download.',
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        if (_selectedIndex == 3)
                          WebAppbar(
                            title: 'Standard Plan',
                            subTitle: 'Your Plan and account details',
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                      ],
                    ),
                    SizedBox(
                      height: maxHeight(context) * 0.03,
                    ),
                    if (_selectedIndex != 3 && _selectedIndex != 2)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,

                            //  width: maxWidth(context)*0.5,
                            child: SizedBox(
                              height: maxHeight(context) * 0.04,
                              child: ListView.builder(
                                itemCount: _chips.length,
                                scrollDirection: Axis.horizontal,
                                // shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10),
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
                                        width: 0,
                                        color: index == _chipIndex
                                            ? Color(0xff1E76DE)
                                            : kTapBorderAssets,
                                      )),
                                      labelStyle: poppinsRegular()
                                          .copyWith(fontSize: 11),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          //Pop ups for sorting and release
                          const FiltersWebBar()
                          //    //Pop ups for sorting and release ended
                        ],
                      ),
                    SizedBox(
                      height: maxHeight(context) * 0.02,
                    ),

                    //Main area
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        children: <Widget>[
                          MainPage(
                              isLocalPage: true, isPackView: _chipIndex == 0),
                          MainPage(
                              isLocalPage: false, isPackView: _chipIndex == 0),
                          MainPage(
                              isLocalPage: true, isPackView: _chipIndex == 0),
                         const MyPlanScreen(),
                        ],
                        physics:
                            const NeverScrollableScrollPhysics(), // disable swipe
                        onPageChanged: (pageIndex) {
                          // On Swipe left or right

                          if (_selectedIndex == 1) {
                            showLoaderDialog(context, 'Loading your data...');
                            Future.delayed(
                              const Duration(milliseconds: 1250),
                              () => kNavigator(context).pop(),
                            );
                          }
                          setState(() => _selectedIndex = pageIndex);
                        },
                      ),
                    ),

                    //Main Area End
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

//web appbar down

class WebAppbar extends StatefulWidget {
  WebAppbar({
    required this.title,
    required this.subTitle,
    required this.onChanged,
    Key? key,
  }) : super(key: key);
  String title;
  String subTitle;
  Function onChanged;

  @override
  State<WebAppbar> createState() => _WebAppbarState();
}

class _WebAppbarState extends State<WebAppbar> {
  bool showProfileOption = false;
  bool isSync = false;
  bool isExpanded = false;

  Widget buildListTile(
      {required IconData leadingIcon,
      IconData? trailing,
      required String title,
      required String subTitle,
      required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // width: 300,
        child: ListTile(
          leading: Icon(
            leadingIcon,
            color: Colors.white,
            size: 20,
          ),
          title: Text(
            title,
            style: poppinsMedium()
                .copyWith(fontWeight: FontWeight.w300, fontSize: 13),
          ),
          subtitle: Text(
            subTitle,
            style: poppinsRegular().copyWith(
                color: Colors.white.withOpacity(
                  0.5,
                ),
                fontSize: 10),
          ),
          trailing: Icon(
            trailing,
            size: 20,
            color: Colors.white,
          ),
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
                                  PopupMenuItem(
                                    child: buildListTile(
                                        leadingIcon: Icons.stop,
                                        title: 'Stop Sync',
                                        subTitle: '',
                                        onTap: () {
                                          setState(() {
                                            isSync = false;
                                          });
                                          Navigator.of(context).pop();
                                        }),
                                  ),
                                  PopupMenuItem(
                                    child: buildListTile(
                                        leadingIcon: Icons.playlist_add_check,
                                        title: 'Show Progress',
                                        subTitle:
                                            'Present all current cloud tasks',
                                        onTap: () {}),
                                  ),
                                ], context: context)
                              : showPopupMenu(popups: [
                                  PopupMenuItem(
                                    child: buildListTile(
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
                                  ),
                                  PopupMenuItem(
                                    child: buildListTile(
                                        leadingIcon:
                                            Icons.rocket_launch_outlined,
                                        title: 'Sync & Launch',
                                        subTitle:
                                            'Launch Minecraft automatically after the sync',
                                        onTap: () {}),
                                  ),
                                ], context: context);
                        },
                        icon: const Icon(
                          Icons.sync_outlined,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(47, 47),
                          maximumSize: Size(100, 47),
                        ),
                        label: Text(
                          isSync ? 'Syncing...' : 'Sync',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: maxWidth(context) * 0.01,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          showPopupMenu(context: context, popups: [
                            PopupMenuItem(
                              child: buildListTile(
                                leadingIcon: Icons.person_outline,
                                title: 'Plan Details',
                                subTitle: 'View Your Plan and Account Details',
                                onTap: () {},
                              ),
                            ),
                            PopupMenuItem(
                              child: buildListTile(
                                leadingIcon: Icons.desktop_windows,
                                title: 'Manage Devices',
                                subTitle: 'Manage your connected devices',
                                trailing: Icons.launch,
                                onTap: () {},
                              ),
                            ),
                            PopupMenuItem(
                              child: buildListTile(
                                  leadingIcon: Icons.logout_outlined,
                                  title: 'Logout',
                                  subTitle: 'Logout from Minecloud',
                                  onTap: () {
                                    showLogoutDialog(
                                        context: context, title: 'Logout');
                                  }),
                            ),
                          ]);
                        });
                      },
                      child: Container(
                          height: 43,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                              gradient: darkPopupGradient,
                              borderRadius: BorderRadius.circular(50)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: kDialogBg,
                                    radius: 16,
                                    child: Text('T'),
                                  ),
                                  SizedBox(
                                    width: maxWidth(context) * 0.005,
                                  ),
                                  Text(
                                    "tallme20@gmail.com",
                                    style: poppinsRegular(),
                                  ),
                                  SizedBox(
                                    width: maxWidth(context) * 0.005,
                                  ),
                                  const Icon(
                                    Icons.expand_more,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: maxHeight(context) * 0.01,
        ),
        Text(
          widget.subTitle,
          style:
              poppinsRegular().copyWith(color: Colors.white.withOpacity(0.5)),
        ),
      ],
    );
  }
}
