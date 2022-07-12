import 'package:flutter/material.dart';

import '../common/theme/colors.dart';
import '../common/theme/text.dart';

Widget worldPackTile(bool isWorld){
  return Card(
    margin:
    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    shape:        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // <-- Radius
    ),
    color: kTapBorderAssets,
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 6,
      ),
      dense: true,
      leading: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        child: Container(
          height: 90 * 0.6,
          width: isWorld ? 90 : 90 * 0.6,
          color: kTapBorderAssets,
          child:
          isWorld ?
          Image.network(
            'https://static.wikia.nocookie.net/minecraft_gamepedia/images/4/47/Glacier_b1.7.3.png/revision/latest?cb=20200607182238',
            fit: BoxFit.cover,
          )
          : Image.asset('assets/images/pack_icon.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        'Clear Vanilla',
        style: poppinsRegular().copyWith(fontSize: 13),
      ),
      subtitle: Text(
        '21:08 - 21.3 MB',
        style: poppinsRegular()
            .copyWith(fontSize: 10, color: kDetailedWhite60),
      ),
      trailing: Column(
        children: [
          ClipRRect(
            borderRadius:
            const BorderRadius.all(Radius.circular(4)),
            child: Container(
              color: kTapBorderAssets,
              padding: const EdgeInsets.symmetric(
                  horizontal: 6, vertical: 4),
              child: Text('SYNCED',
                  style: poppinsRegular().copyWith(
                    fontSize: 10,
                    color: kDetailedWhite60,
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}