import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:monomarkaz/src/ui/splash/splash_screen.dart';

String language = 'en';
bool isLightMode = true;

void main() async {
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: ['ru', 'en', 'uz'],
  );
  runApp(LocalizedApp(delegate, const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    localizationDelegate.changeLocale(Locale(language));
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        theme: ThemeData(
          brightness: isLightMode == true ? Brightness.light : Brightness.dark,
          canvasColor: Colors.transparent,
          platform: TargetPlatform.iOS,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFF818C99),
            brightness:
            isLightMode == true ? Brightness.light : Brightness.dark,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}