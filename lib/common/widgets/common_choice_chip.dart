import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/text.dart';

class CommonChoiceChip extends StatelessWidget {
  final String text;
  final int chipIndex;
  final int index;
  final ValueChanged<bool>? onSelected;

  const CommonChoiceChip(
      {Key? key, required this.text, required this.chipIndex , required this.index, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(text),
      selected: chipIndex == index,
      selectedColor: const Color(0xff1E76DE),
      onSelected: onSelected,
      backgroundColor: kTapBorderAssetsFull,
      shape: StadiumBorder(
          side: BorderSide(
            width: 0,
            color: index == chipIndex
                ? const Color(0xff1E76DE)
                : kTapBorderAssets,
          )),
      labelStyle: poppinsRegular()
          .copyWith(fontSize: 11),
    );
  }
}

