import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/theme/constants.dart';
import 'package:minecloud_tal/common/theme/text.dart';
import 'package:minecloud_tal/functions/svgIconWidget.dart';

import '../../common/theme/colors.dart';

class MyPlanScreen extends StatelessWidget {
  const MyPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEmptyColor,
      body: Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: darkPopupGradient,
                    ),
                    child: Row(
                      children: [
                        //Cloud Storage box start
                        Expanded(
                          flex: 4,
                          child: Align(
                            // alignment: Alignment.centerLeft,
                            child: Stack(children: [
                              Container(
                                height: maxHeight(context) * 0.1,
                                width: maxHeight(context) * 0.1,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(102, 144, 184, 0.04),
                                    borderRadius:
                                        BorderRadius.circular(50)),
                                child: Center(
                                  child: Text(
                                    '75%',
                                    style: poppinsRegular(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: maxHeight(context) * 0.1,
                                  width: maxHeight(context) * 0.1,
                                  child: const Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: CircularProgressIndicator(
                                      color: kPositiveBlueGui,
                                      value: (75 / 100),
                                    ),
                                  )),
                            ]),
                          ),
                        ),
                        // Expanded(flex: 1, child: Container()),

                        Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Text(
                                  'Cloud Storage',
                                  style: poppinsMedium(),
                                ),
                              ),
                              SizedBox(
                                height: maxHeight(context) * 0.02,
                              ),
                              FittedBox(
                                child: Text(
                                  '52.3 MB used of 500 MB',
                                  style: poppinsRegular(),
                                ),
                              )
                            ],
                          ),
                        ),

                        //Cloud Storage box end
                      ],
                    ),
                    height: maxHeight(context) * 0.15),
              ),
              SizedBox(
                width: maxWidth(context) * 0.02,
              ),
              // Webiste Box Start
              Expanded(
                flex: 6,
                child: Container(
                  height: maxHeight(context) * 0.16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: positiveBlueButtonGradient,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: maxHeight(context) * 0.02,
                              horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                  'assets/images/minecloudLogo.png'),
                              Padding(
                                padding: const EdgeInsets.only(left: 42.0),
                                child: Text(
                                  'www.minicloud.site',
                                  style: poppinsRegular(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: maxHeight(context) * 0.02),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              buildSvgIconBox(
                                  'assets/svg/discordfilled.svg', context),
                              const SizedBox(
                                width: 10,
                              ),
                              buildSvgIconBox(
                                  'assets/svg/globe-913.svg', context),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 35,
                                // width: 120,
                                padding: const EdgeInsets.symmetric(
                                horizontal: 5),
                                // height: maxHeight(context) * 0.04,
                                // width: maxWidth(context) * 0.002,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.2),
                                    borderRadius:
                                        BorderRadius.circular(20)),
                                child: Center(
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextButton.icon(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.launch_outlined,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          label: Text(
                                            'Webiste',
                                            style: poppinsStandard()
                                                .copyWith(fontSize: 12),
                                          )),
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Webiste Box End
            ],
          ),
          SizedBox(
            height: maxHeight(context) * 0.03,
          ),
          Row(
            children: [
              // Devices Box Start
              Expanded(
                flex: 6,
                child: Container(
                  height: maxHeight(context) * 0.16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: darkPopupGradient),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: maxWidth(context) * 0.3,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Devices',
                              style: poppinsMedium(),
                            ),
                            Stack(children: [
                              Container(
                                height: maxHeight(context) * 0.002,
                                width: maxWidth(context),
                                color: kDialogBg.withOpacity(0.5),
                              ),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                child: Container(
                                  height: maxHeight(context) * 0.002,
                                  width: 150,
                                  color: kPositiveBlueGui,
                                ),
                              ),
                            ]),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '3 Device(s)',
                                  style: poppinsRegular(),
                                ),
                                Text(
                                  'of 6 total',
                                  style: poppinsRegular(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 15, right: 10),
                          height: 35,
                          decoration: BoxDecoration(
                              color:
                                  const Color.fromRGBO(102, 144, 184, 0.2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.launch,
                                    size: 18,
                                  ),
                                  label: Text(
                                    'Manage',
                                    style: poppinsStandard()
                                        .copyWith(fontSize: 12),
                                  )))),
                    ],
                  ),
                ),
              ),
              // Devices Box End
              SizedBox(
                width: maxWidth(context) * 0.02,
              ),
              // Standard Plan Box Start
              Expanded(
                flex: 3,
                child: Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: darkPopupGradient),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Align(
                          // alignment: Alignment.centerLeft,
                          child: Stack(children: [
                            Container(
                              height: maxHeight(context) * 0.1,
                              width: maxHeight(context) * 0.1,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(102, 144, 184, 0.04),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text(
                                  '75%',
                                  style: poppinsRegular(),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: maxHeight(context) * 0.1,
                                width: maxHeight(context) * 0.1,
                                child: const Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: CircularProgressIndicator(
                                    color: kPositiveBlueGui,
                                    value: (75 / 100),
                                  ),
                                )),
                          ]),
                        ),
                      ),
                      // Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                'Standard Plan',
                                style: poppinsMedium(),
                              ),
                            ),
                            SizedBox(
                              height: maxHeight(context) * 0.02,
                            ),
                            FittedBox(
                              child: Text(
                                '21 days left • 22/06/22 ',
                                style:
                                    poppinsRegular().copyWith(fontSize: 11),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  height: maxHeight(context) * 0.15,
                ),
              ),
              // Standard Plan Box End
            ],
          ),
        ],
      ),
    ),
      ),
    );
  }
}
