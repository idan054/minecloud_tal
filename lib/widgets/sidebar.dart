import 'package:flutter/material.dart';
import 'package:minecloud_tal/widgets/actionTileWs.dart';
import 'package:minecloud_tal/widgets/simpleWs.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/theme/colors.dart';
import '../common/theme/constants.dart';
import '../common/theme/text.dart';

class SideBar extends StatefulWidget {
  SideBar({
    required this.selectedIndex,
    required this.onChanged,
  });

  int selectedIndex;

  Function onChanged;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int select = 0;
  @override
  Widget build(BuildContext context) {
    select=widget.selectedIndex;
    return Drawer(
      backgroundColor: darkBg,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: maxHeight(context) * 0.035),
              child:
                  Center(child: Image.asset('assets/images/minecloudLogo.png')),
            ),
            // const SizedBox(height: 15,),
            lightDivider(),
            // actionTile(Icons.sync_outlined, 'Sync'),
            InkWell(
             onTap: () {
              setState(() {
                widget.onChanged(0);
                select = 0;
              });
            },
              child: quickTile(
                name: 'Local',
                // onTap: () => isSyncPage
                //     ? kPushNavigator(context,  DashBoard(), replace: true)
                //     : kNavigator(context).pop(),
                leadingIcon: Icons.home,
                isActive: widget.selectedIndex == 0,
              ),
            ),
            InkWell(
               onTap: () {
              setState(() {
                widget.onChanged(1);
                select = 1;
              });
            },
              child: quickTile(
                name: 'Cloud',
                // onTap: () => isSyncPage
                //     ? kPushNavigator(context,  DashBoard(), replace: true)
                //     : kNavigator(context).pop(),
                leadingIcon: Icons.cloud_outlined,
                isActive: widget.selectedIndex == 1,
              ),
            ),

            InkWell(
           onTap: () {
            print('two');
              setState(() {
                widget.onChanged(2);
                select = 2;
              });
            },
              child: quickTile(

                name: 'Sync progress',
                // onTap: () => isSyncPage
                //     ? kNavigator(context).pop()
                //     : kPushNavigator(context, const SyncProgressPage()),
                leadingIcon: Icons.playlist_add_check_outlined,
                isActive: widget.selectedIndex == 2,
              ),
            ),

            SizedBox(
              height: kMediaQuerySize(context).height * 0.025,
            ),
            lightDivider(),
            SizedBox(height: maxHeight(context) * 0.02),

            InkWell(
              onTap: () {
            print('two');
              setState(() {
                widget.onChanged(3);
                select = 3;
              });
            },
              child: quickTile(
                name: 'Plan Details',
                // onTap: () async =>
                //     await launchUrl(Uri.parse('https://flutter.io')),
                leadingIcon: Icons.person_outline,
                // trailingIcon: Icons.launch
                isActive: widget.selectedIndex==3,
              ),
            ),

            quickTile(
                name: 'Help & feedback',
                onTap: () async =>
                    await launchUrl(Uri.parse('https://flutter.io')),
                leadingIcon: Icons.help_outline,
                trailingIcon: Icons.launch),

            // const Spacer(),

            // const Spacer(),

            SizedBox(
              height: maxHeight(context) * 0.025,
            ),
            lightDivider(),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: maxHeight(context) * 0.025),
              child: Text(
                'Minecraft Bedrock 1.17.40.06',
                style: poppinsRegular().copyWith(color: kDetailedWhite60),
              ),
            )
          ],
        ),
      ),
    );
  }
}
