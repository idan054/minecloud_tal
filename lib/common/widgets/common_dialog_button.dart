import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/text.dart';

class CommonDialogButton extends StatelessWidget {
  const CommonDialogButton({
    Key? key,
    required this.text,
    required this.btnColor,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final Color btnColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Color buttonColor = btnColor;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(buttonColor),
            minimumSize: MaterialStateProperty.all(const Size(999, 45)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: const BorderSide(color: kSecondaryButton, width: 2),
                borderRadius: BorderRadius.circular(10), // <-- Radius
              ),
            )),
        icon: const Icon(Icons.hide_image, size: 0),
        label: Text(
          text,
          style: poppinsMedium().copyWith(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
