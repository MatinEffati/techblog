import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/ui/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0)).then(
      (value) {
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.techblog.image(height: 64),
              const SizedBox(
                height: 32,
              ),
              const Loading(),
            ],
          ),
        ),
      ),
    );
  }
}


