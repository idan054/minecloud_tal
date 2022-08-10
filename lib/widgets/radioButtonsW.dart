import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';

class RadioButtons extends StatefulWidget {
  const RadioButtons({Key? key}) : super(key: key);

  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  int? selectedIndex;
  List typeIndex = [0, 1, 2];
  List types = ['Name', 'Last modified', 'Size'];
  String? _sortBy;

  // Todo make "Sort by" works

  @override
  Widget build(BuildContext context) {
    _sortBy = kUniModel(context).sortBy;
    if(_sortBy == 'Name') selectedIndex = 0;
    if(_sortBy == 'Last modified') selectedIndex = 1;
    if(_sortBy == 'Size') selectedIndex = 2;

    return Column(
      children: <Widget>[
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
                      kUniModel(context).updateSortBy(types[selectedIndex!]);
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
