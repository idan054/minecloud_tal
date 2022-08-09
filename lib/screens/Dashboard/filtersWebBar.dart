import 'package:flutter/material.dart';

import '../../common/theme/text.dart';
import '../../widgets/popup_menu.dart';

class FiltersWebBar extends StatelessWidget {
  const FiltersWebBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 5, vertical: 4),
            decoration: BoxDecoration(
              // color: kDialogBg,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Text(
                  'Sort By:',
                  style: poppinsRegular()
                      .copyWith(fontSize: 13),
                ),
                Container(
                  width: 80,
                  child: CustomPopUpMenu(
                    parent: Row(
                      children: [
                        Text(
                          ' Name',
                          style: poppinsRegular()
                              .copyWith(
                              color: Colors.blue,
                              fontSize: 12),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        )
                      ],
                    ),
                    menuList: [
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        child: Center(
                          child: Text(
                            'Last Modified',
                            style: poppinsStandard()
                                .copyWith(
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        child: Center(
                          child: Text(
                            'Name',
                            style: poppinsStandard()
                                .copyWith(
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        child: Center(
                          child: Text(
                            'Size',
                            style: poppinsStandard()
                                .copyWith(
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //second drop down
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 5, vertical: 4),
            decoration: BoxDecoration(
              // color: kDialogBg,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Text(
                  'Sort By:',
                  style: poppinsRegular()
                      .copyWith(fontSize: 13),
                ),
                Container(
                  width: 80,
                  child: CustomPopUpMenu(
                    parent: Row(
                      children: [
                        Text(
                          ' Release',
                          style: poppinsRegular()
                              .copyWith(
                              color: Colors.blue,
                              fontSize: 12),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        )
                      ],
                    ),
                    menuList: [
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        child: Center(
                          child: Text(
                            'Release',
                            style: poppinsStandard()
                                .copyWith(
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        child: Center(
                          child: Text(
                            'Beta',
                            style: poppinsStandard()
                                .copyWith(
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
