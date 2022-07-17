import 'package:flutter/material.dart';

import '../common/theme/colors.dart';
import '../common/theme/text.dart';

class AccountInfoTileW extends StatelessWidget {
  final String type;
  final String usage;
  final double usageValue;
  final String limit;
  const AccountInfoTileW({
    required this.type,
    required this.usage,
    required this.usageValue,
    required this.limit,
    Key? key}) : super(key: key);

  // todo change to listView.builder based AccountInfoTile() Widget
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kTapBorderAssets,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 20,
          backgroundColor: kTapBorderAssets,
        ),
        onTap: () {},
        title: Text(
          type,
          style: poppinsMedium()
              .copyWith(color: kImportantWhite80, fontSize: 12),
        ),
        // todo show User email here
        subtitle: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ClipRRect(
                borderRadius:  BorderRadius.circular(99),
                child: LinearProgressIndicator(
                  value: usageValue,
                  color: kLoadingGrey,
                  backgroundColor: kProgressBar,
                ),
              ),
            ),
            Row(
              children: [
                Text(usage,
                    style: poppinsRegular().copyWith(
                        fontSize: 11, color: kDetailedWhite60)),
                const Spacer(),
                Text(limit,
                    style: poppinsRegular().copyWith(
                        fontSize: 11, color: kDetailedWhite60)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
