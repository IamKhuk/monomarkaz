import 'package:flutter/material.dart';
import 'package:onboarding_animation/onboarding_animation.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../theme/app_theme.dart';
import 'card_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;
  int currentPageValue = 0;
  double pageValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPageValue);
    _controller.addListener(() {
      setState(() {
        pageValue = _controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: OnBoardingAnimation(
        controller: _controller,
        pages: [
          GetCardsContent(
            image: 'assets/images/onboarding_01.jpg',
            title: translate("onBoarding_title_01"),
            text: translate("onBoarding_text_01"),
            controller: _controller,
          ),

          GetCardsContent(
            image: 'assets/images/onboarding_02.jpg',
            title: translate("onBoarding_title_02"),
            text: translate("onBoarding_text_02"),
            controller: _controller,
          ),
          GetCardsContent(
            image: 'assets/images/onboarding_03.jpg',
            title: translate("onBoarding_title_03"),
            text: translate("onBoarding_text_03"),
            controller: _controller,
          ),
        ],
        indicatorDotHeight: 8,
        indicatorDotWidth: 8,
        indicatorInActiveDotColor: AppTheme.black.withOpacity(0.2),
        indicatorActiveDotColor: AppTheme.white,
        indicatorActiveStrokeWidth: 20,
        indicatorDotSpacing: 4,
        indicatorType: IndicatorType.expandingDots,
        indicatorPosition: IndicatorPosition.center,
      ),
    );
  }
}