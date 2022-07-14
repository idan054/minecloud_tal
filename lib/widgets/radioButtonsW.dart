import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/text.dart';

import '../common/theme/constants.dart';

class RadioButtons extends StatefulWidget {
  const RadioButtons({Key? key}) : super(key: key);

  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  int selectedIndex = 1;
  List typeIndex = [0, 1, 2];
  List types = ['Last modified', 'Name', 'Size'];
  // Todo make "Sort by" works

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // for (int i = 1; i <= 3; i++)
        for (int i in typeIndex)
          Builder(
            builder: (context) {
              bool isSelected = selectedIndex == i;
              return Container(
                color: isSelected ? Colors.white10 : kEmptyColor,
                child: ListTile(
                title: Text(
                  '${types[i]}',
                  style: poppinsRegular().copyWith(
                      color: isSelected ? kPositiveWhite : kDetailedWhite60,
                      fontSize: 12
                  ),
                ),
                leading: Radio(
                  fillColor: MaterialStateProperty.all(isSelected ? kLoadingGrey : kDetailedWhite60),
                  value: i,
                  groupValue: selectedIndex,
                  onChanged: (int? value) {
                    setState(() {
                      selectedIndex = value!;
                      kNavigator(context).pop();
                    });
                  },
                ),
        ),
              );
            }
          ),
      ],
    );
  }
}
