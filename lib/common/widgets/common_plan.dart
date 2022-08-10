import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/text.dart';

class CommonPlan extends StatelessWidget {

  List<Map<String, String>> planDesc = [
    {'t1': "125 MB", 't2': " cloud storage"},
    {'t1': "2", 't2': " uploads & downloads per day"},
    {'t3':"up to", 't1':" 2 ", 't2': "connected devices"},
  ];

  CommonPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: planDesc.length,
      itemBuilder: (context, index) => ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        horizontalTitleGap: 0,
        leading: const Icon(
          Icons.done,
          color: Colors.blue,
        ),
        title: Row(
          children: [
            if (planDesc[index].containsKey('t3'))
              Text(
                planDesc[index]['t3']!,
                style: poppinsRegular().copyWith(
                  fontSize: 12,
                  color: kDetailedWhite60,
                ),
              ),
            Text(
              planDesc[index]['t1']!,
              style: poppinsRegular().copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              planDesc[index]['t2']!,
              style: poppinsRegular().copyWith(
                fontSize: 12,
                color: kDetailedWhite60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
