import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme/app_theme.dart';
import '../menu/home/home_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Offset>? offset;

  @override
  void initState() {
    _setLanguage();
    _nextScreen();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1270),
    )..forward();
    offset = Tween<Offset>(
      begin: const Offset(0.0, 4.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blue,
      body: Stack(
        children: [
          Column(
            children: [
              SvgPicture.asset(
                'assets/icons/splash_up.svg',
                color: AppTheme.white.withOpacity(0.7),
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/splash_down.svg',
                color: AppTheme.white.withOpacity(0.7),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LOADING...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: AppTheme.fontFamily,
                        letterSpacing: 0.14,
                        color: AppTheme.blue.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: SlideTransition(
              position: offset!,
              child: const SizedBox(
                height: 60,
                child: Text(
                  'SurxonTourism',
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: AppTheme.blue,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _setLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var lan = prefs.getString('language') ?? "en";
    var localizationDelegate = LocalizedApp.of(context).delegate;
    localizationDelegate.changeLocale(Locale(lan));
  }

  _nextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirst = prefs.getBool('isFirst') ?? true;

    Timer(
      const Duration(milliseconds: 2270),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return isFirst == true
                  ? const OnBoardingScreen()
                  : const HomeScreen();
            },
          ),
        );
      },
    );
  }
}