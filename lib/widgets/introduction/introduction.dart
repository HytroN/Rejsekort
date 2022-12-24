import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rejsekort/screens/auth_screen.dart';
import 'package:rejsekort/screens/navigationbar_screen.dart';
import 'package:rejsekort/widgets/auth/auth_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Introduction extends StatefulWidget {
  static const routeName = '/introduction';
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName, [double width = 250]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 25.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Opret en konto og få dit digitale rejsekort",
          body:
              "Opret en konto og få dit helt eget digitale rejsekort, så du kan nemt og hurtigt betale for din transport.",
          image: _buildImage('phonesketch.png'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 1,
            imageFlex: 1,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          reverse: true,
        ),
        PageViewModel(
          title: "Nemt og hurtigt betalingssystem med digitale rejsekort",
          body:
              "Når man tager transporten, er det vigtigt at scanne appen for at sikre at man betaler for sin rejse.",
          image: _buildImage('nfcscan.gif'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 1,
            imageFlex: 1,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          reverse: true,
        ),
        PageViewModel(
          title: "Dit helt personlige rejsekort",
          body:
              "Med dit helt personlige rejsekort, har du altid nem og hurtig adgang til at betale for din transport. ",
          image: _buildImage('rejsekort.png', 200),
          decoration: pageDecoration.copyWith(
            bodyFlex: 1,
            imageFlex: 1,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          reverse: true,
        ),
      ],
      onDone: () {
        Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
      },
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text(
        'Skip',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      next: const Icon(Icons.arrow_forward),
      done: const Text(
        'Næste',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
