import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/strings.dart';
import 'package:tech_blog/ui/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.menu,color: Colors.black,),
              Assets.images.techblog.image(height: size.height / 13.6),
              const Icon(Icons.search,color: Colors.black,)
            ],
          ),
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
        ),
        body: Stack(
          children: [
            HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: size.height/10,
                padding: EdgeInsets.only(left:bodyMargin,right: bodyMargin),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: GradiantColors.bottomNavBackground,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Container(
                  height: size.height/8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                          colors: GradiantColors.bottomNav
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: () {

                      }, icon: const Icon(CupertinoIcons.house_fill,color: Colors.white)),
                      IconButton(onPressed: () {

                      }, icon: ImageIcon(Image.asset(Assets.icons.write.path).image),color: Colors.white,),
                      IconButton(onPressed: () {

                      }, icon: const Icon(CupertinoIcons.person_fill,color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

