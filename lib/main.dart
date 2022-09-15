import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/colors.dart';
import 'package:tech_blog/ui/article_list_screen.dart';
import 'package:tech_blog/ui/main_screens/main_screen.dart';
import 'package:tech_blog/ui/single.dart';

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
    var textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      locale: const Locale('fa'),
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
              color: SolidColors.posterTitle),
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
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          headline5: TextStyle(
              fontFamily: 'Dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColors.hintText),
          bodyText1: TextStyle(
            fontFamily: 'Dana',
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
          subtitle1: TextStyle(
              fontFamily: 'Dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColors.posterSubTitle),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return textTheme.headline1;
                }
                return textTheme.subtitle1;
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return SolidColors.primaryColor;
                }
                return SolidColors.primaryColor;
              },
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      home: ArticleListScreen(),
    );
  }
}
