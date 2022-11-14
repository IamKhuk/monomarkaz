import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:monomarkaz/src/ui/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/app_theme.dart';

class GetCardsContent extends StatelessWidget {
  final String image, title, text;
  final PageController controller;

  const GetCardsContent({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    required this.controller,
  }) : super(key: key);

  Future<bool> initializeController() {
    Completer<bool> completer = new Completer<bool>();

    /// Callback called after widget has been fully built
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.hasData) {
          return SizedBox();
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height - 16,
            width: MediaQuery.of(context).size.width - 16,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppTheme.white,
                        AppTheme.white,
                        AppTheme.white,
                        AppTheme.white,
                        AppTheme.white,
                        AppTheme.white.withOpacity(0.7),
                        AppTheme.white.withOpacity(0.3),
                        AppTheme.white.withOpacity(0.1),
                        AppTheme.white.withOpacity(0.01),
                        AppTheme.white.withOpacity(0.001),
                        AppTheme.white.withOpacity(0.0001),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: AppTheme.fontFamily,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.black,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.fontFamily,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.gray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 36),
                    GestureDetector(
                      onTap: () async {
                        if (controller.page == 2) {
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          prefs.setBool('isFirst', false);
                          Navigator.popUntil(context, (route) => route.isFirst);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } else if (controller.page == 0) {
                          controller.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 590),
                            curve: Curves.easeInOut,
                          );
                        } else if (controller.page == 1) {
                          controller.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 590),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 36,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.blue,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 2),
                              blurRadius: 20,
                              spreadRadius: 0,
                              color: AppTheme.black.withOpacity(0.05),
                            ),
                          ],
                        ),
                        child: Text(
                          translate("next"),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTheme.fontFamily,
                              color: AppTheme.white,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 92),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}