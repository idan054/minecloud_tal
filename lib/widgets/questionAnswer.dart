import 'package:flutter/material.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/text.dart';

import 'accountInfoTileW.dart';
import 'buttonsWs.dart';

class AccountDetails extends StatefulWidget {
  final String question;
  final String? answer;
  final Widget? richAnswer;

  AccountDetails({required this.question, this.answer, this.richAnswer});

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  bool isAnswerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Container(
          color: Colors.white.withOpacity(0.00),
          child: Column(
            children: [
              const AccountInfoTileW(
                type: 'Cloud Storage',
                limit: 'of 500 MB',
                usage: '58.91 MB used',
                usageValue: 0.12,
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 250),
                secondChild: const Offstage(),
                crossFadeState: isAnswerOpen
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: Column(
                  children: const [
                    AccountInfoTileW(
                      type: 'Devices',
                      limit: 'of 7 total',
                      usage: '3 Device(s)',
                      usageValue: 0.42,
                    ),

                    AccountInfoTileW(
                      type: 'Uploads & Downloads',
                      limit: 'of 2 total',
                      usage: '0 left for today',
                      usageValue: 1.0,
                    ),
                  ],
                )
              ),
            ],
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
                onPressed: () => setState(() => isAnswerOpen = !isAnswerOpen),
                iconW: Icon(isAnswerOpen ? Icons.north : Icons.south,
                    color: kDetailedWhite60, size: 14),
                showBorder: true,
                miniMode: true),
          ),
        ),
      ],
    );
  }
}
