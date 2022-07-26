import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:minecloud_tal/common/theme/colors.dart';
import 'package:minecloud_tal/common/theme/text.dart';

import '../widgets/buttonsWs.dart';


class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {

    var pageDecoration = PageDecoration(
      titleTextStyle: poppinsMedium(),
      bodyTextStyle: poppinsRegular(),
      bodyPadding: const EdgeInsets.symmetric(vertical: 8),
      boxDecoration: const BoxDecoration(gradient: darkBackgroundGradient),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.black,
      globalHeader: Column(
        children: [
          const SizedBox(height: 45,),
          Center(child: Image.asset('assets/images/minecloudLogo.png')),
        ],
      ),
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      skipOrBackFlex: 0,
      overrideNext: SizedBox(
          width: 100,
          child: positiveButton('Nextt', onPressed: () async {})),
      nextFlex: 0,
      showSkipButton: false,
      showBackButton: false,
      showDoneButton: false,
      showNextButton: true,
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: const Size(8, 8),
        color: kVerySpecificWhite40,
        activeColor: kPositiveWhite,
        activeSize: const Size(8, 8),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: kEmptyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Another title page",
          body: "Another beautiful body text for this example onboarding",
          image: FlutterLogo(size: 80),
          footer: positiveButton('Next', onPressed: () async {}),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Title of last page - reversed",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [

            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: FlutterLogo(size: 80),
          reverse: true,
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}