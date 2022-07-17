import 'package:flutter/material.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/text.dart';

import 'buttonsWs.dart';

class AccountDetails extends StatefulWidget {
  final String question;
  final String? answer;
  final Widget? richAnswer;

  AccountDetails(
      {required this.question,
        this.answer,
        this.richAnswer});

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  AnimateIconController arrowController = AnimateIconController();
  bool isAnswerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: true,
        child: Column(
          children: [
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                if (arrowController.isStart()) {
                  arrowController.animateToEnd();
                  setState(() {
                    isAnswerOpen = true;
                  });
                } else if (arrowController.isEnd()) {
                  arrowController.animateToStart();
                  setState(() {
                    isAnswerOpen = false;
                  });
                }
              },
              child: Container(
                color: Colors.white.withOpacity(0.00),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            widget.question,
                            style: poppinsRegular(),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.clip,
                            softWrap: true,
                          ),
                        ),
                        AnimateIcons(
                          controller: arrowController,
                          startIcon: Icons.keyboard_arrow_down,
                          endIcon: Icons.keyboard_arrow_up,
                          size: 30.0,
                          onStartIconPress: () {
                            print("Clicked on Add Icon");
                            setState(() {
                              isAnswerOpen = true;
                            });
                            return true;
                          },
                          onEndIconPress: () {
                            print("Clicked on Close Icon");
                            setState(() {
                              isAnswerOpen = false;
                            });
                            return true;
                          },
                          duration: const Duration(milliseconds: 150),
                          startIconColor: kVerySpecificWhite40,
                          endIconColor: kVerySpecificWhite40,
                          clockwise: false,
                        ),
                      ],
                    ),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 350),
                      crossFadeState: isAnswerOpen
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 48.5),
                        child: widget.richAnswer ?? Text(
                                '${widget.answer}',
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                style: poppinsRegular(),
                              ),
                      ),
                      secondChild: Container(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 150,
              // height: 35,
              margin: const EdgeInsets.only(bottom: 15, top: 5),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: secondaryIconButton(
                    text: isAnswerOpen ? 'Show less' : 'Show more',
                    textColor: kImportantWhite80,
                    onPressed: (){
                      if (arrowController.isStart()) {
                        arrowController.animateToEnd();
                        setState(() {
                          isAnswerOpen = true;
                        });
                      } else if (arrowController.isEnd()) {
                        arrowController.animateToStart();
                        setState(() {
                          isAnswerOpen = false;
                        });
                      }
                    },
                    iconW:   Icon(
                        isAnswerOpen ? Icons.north
                        : Icons.south, color: kDetailedWhite60, size: 14),
                    showBorder: true,
                    miniMode: true),
              ),
            ),
          ],
        ));
  }
}
