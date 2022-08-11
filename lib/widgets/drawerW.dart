import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/screens/Dashboard/dashboard.dart';
import 'package:minecloud_tal/screens/plans/plans.dart';
import 'package:minecloud_tal/screens/syncProgress_page.dart';
import 'package:minecloud_tal/widgets/simpleWs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'actionTileWs.dart';
import 'buttonsWs.dart';

class DrawerW extends StatelessWidget {
  final bool isSyncPage;

  const DrawerW({this.isSyncPage = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var maxHeight = kMediaQuerySize(context).height;
    return Drawer(
      backgroundColor: darkBg,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: maxHeight * 0.035),
              child:
                  Center(child: Image.asset('assets/images/minecloudLogo.png')),
            ),
            lightDivider(),
            quickTile(
              name: 'Home',
              onTap: () => isSyncPage
                  ? kPushNavigator(context,  const DashBoard(), replace: true)
                  : kNavigator(context).pop(),
              leadingIcon: Icons.home,
            ),
            quickTile(
              name: 'Sync progress',
              onTap: () => isSyncPage
                  ? kNavigator(context).pop()
                  : kPushNavigator(context, const SyncProgressPage()),
              leadingIcon: Icons.playlist_add_check_outlined,
            ),
            SizedBox(
              height: kMediaQuerySize(context).height * 0.025,
            ),
            quickTile(
                name: 'Website',
                onTap: () async =>
                    await launchUrl(Uri.parse('https://flutter.io')),
                leadingIcon: Icons.language,
                trailingIcon: Icons.launch),

            quickTile(
                name: 'Help & feedback',
                onTap: () async =>
                    await launchUrl(Uri.parse('https://flutter.io')),
                leadingIcon: Icons.help_outline,
                trailingIcon: Icons.launch),

            const Spacer(),
            Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.16),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Upgrade your plan',
                      style: poppinsMedium().copyWith(fontSize: 13),
                    ),
                    subtitle: Text(
                      'Sync your assets without a limit.',
                      style: poppinsMedium()
                          .copyWith(fontSize: 9, color: kDetailedWhite60),
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: maxHeight * 0.055, vertical: 10),
                    child: positiveButton('Upgrade',
                        onPressed: () => kPushNavigator(
                            context,  const PlansPage(),
                        )),
                  )
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // todo make the icons clickable
                Icon(
                  Icons.note,
                  color: Colors.white,
                  size: 35,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.music_note,
                  color: Colors.white,
                  size: 35,
                ),
              ],
            ),
            SizedBox(
              height: maxHeight * 0.025,
            ),
            lightDivider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: maxHeight * 0.025),
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
