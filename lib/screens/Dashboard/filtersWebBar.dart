import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/widgets/popup_menu.dart';

class FiltersWebBar extends StatelessWidget {
  FiltersWebBar({Key? key}) : super(key: key);

  List<Map<String, String>> planDesc = [
    {
      'title': "Name",
      'option1': "Last Modified",
      'option2': "Name",
      'option3': "Size"
    },
    {'title': "Release", 'option1': "Release", 'option2': "Beta"},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: List.generate(
            planDesc.length,
            (index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Text(
                    'Sort By:',
                    style: poppinsRegular().copyWith(fontSize: 13),
                  ),
                  SizedBox(
                    width: 80,
                    child: CustomPopUpMenu(
                      parent: Row(
                        children: [
                          Text(
                            planDesc[index]['title']!,
                            style: poppinsRegular()
                                .copyWith(color: Colors.blue, fontSize: 12),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                      menuList: [
                        if (planDesc[index].containsKey('option1'))
                          PopupMenuItem(
                            padding: EdgeInsets.zero,
                              child: buildCenter(planDesc[index]['option1']!)
                          ),
                        if (planDesc[index].containsKey('option2'))
                          PopupMenuItem(
                              padding: EdgeInsets.zero,
                              child: buildCenter(planDesc[index]['option2']!)
                          ),
                        if (planDesc[index].containsKey('option3'))
                          PopupMenuItem(
                              padding: EdgeInsets.zero,
                              child: buildCenter(planDesc[index]['option3']!)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center buildCenter(String text) {
    return Center(
      child: Text(
        text,
        style: poppinsStandard().copyWith(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
