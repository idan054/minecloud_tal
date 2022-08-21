import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/models/plans_model.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/text.dart';

class PlansCleanTiles extends StatefulWidget {
  const PlansCleanTiles({Key? key}) : super(key: key);

  @override
  State<PlansCleanTiles> createState() => _PlansCleanTilesState();
}

class _PlansCleanTilesState extends State<PlansCleanTiles> {
  List<Map<String, dynamic>> planList = [
    {'planTitle': 'Basic', 'planDesc': 'Free forever'},
    {
      'planTitle': 'Standard',
      'planDesc': '4 months • 11.99\$ (2.99\$ per month)'
    },
    {
      'planTitle': 'Extended',
      'planDesc': '6 months • 23.99\$ (3.99\$ per month)'
    },
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        planList.length,
        (index) => planCleanTile(index: index, isBest: index == 1),
      ),
    );
  }

  InkWell planCleanTile({required int index, bool isBest = false, GestureTapCallback? onTap}) {
    return InkWell(
      onTap: () => setState(() => selectedIndex = index),
      child: Card(
        color: kTapBorderAssets,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: index == selectedIndex ? Colors.white : kEmptyColor,
            width: 1.5,
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          dense: true,
          title: Text(
            planList[index]['planTitle'],
            style: poppinsRegular().copyWith(fontSize: 13),
          ),
          subtitle: Text(
            planList[index]['planDesc'],
            style: poppinsRegular().copyWith(fontSize: 10, color: kDetailedWhite60),
          ),
          trailing: isBest
              ? ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Container(
                  decoration: BoxDecoration(gradient: positiveBlueButtonGradient),
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Text(
                    'BEST VALUE',
                    style: poppinsRegular().copyWith(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
              : null,
        ),
      ),
    );
  }
}
