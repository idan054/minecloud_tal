import 'package:flutter/material.dart';

import '../../common/theme/colors.dart';

Widget buildLeadingImage(bool isPack, double size, String? image){
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(6)),
    child:
    Container(
      height: size * 0.6,
      width: isPack ? size : size * 0.6,
      color: kTapBorderAssets,
      child:
      isPack ?
      Image.network(
        'https://static.wikia.nocookie.net/minecraft_gamepedia/images/4/47/Glacier_b1.7.3.png/revision/latest?cb=20200607182238',
        fit: BoxFit.cover,
      )
          : Image.asset('assets/images/pack_icon.png',
        fit: BoxFit.cover,
      ),
    ),
  );
}