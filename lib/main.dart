import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/ui/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBar,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBar,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("fa", "IR"),
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Dana',
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontFamily: 'Dana',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitle
            ),
            headline2: TextStyle(
              fontFamily: 'Dana',
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            headline3: TextStyle(
              fontFamily: 'Dana',
              fontSize: 14,
              color: SolidColors.seeMore,
              fontWeight: FontWeight.w700,
            ),
            headline4: TextStyle(
              fontFamily: 'Dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            bodyText1: TextStyle(
              fontFamily: 'Dana',
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
            subtitle1: TextStyle(
                fontFamily: 'Dana',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: SolidColors.posterSubTitle
            ),
          ),
        ),
        home: const SplashScreen());
  }
}
