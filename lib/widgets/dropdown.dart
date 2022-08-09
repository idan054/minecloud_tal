import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';

import '../common/theme/colors.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({required this.onChanged, required this.items});

  Function onChanged;
  List<String> items;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        // gradient:darkBackgroundGradient ,
        color: kProgressBar.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          dropdownColor: kProgressBar,
          // isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
          ),

          value: widget.items[selectedIndex].toString(),
          style: TextStyle(fontSize: 2),
          items: widget.items.map(buildMenuItem).toList(),
          onChanged: (value) {
            widget.onChanged(value);
            setState(() {
              selectedIndex = widget.items.indexOf(value.toString());
            });
          },
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(item, style: poppinsRegular().copyWith(fontSize: 12)),
      ),
    );
