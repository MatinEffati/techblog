import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/components/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/ui/categories_screen.dart';
import 'package:validators/validators.dart';

class RegisterIntroScreen extends StatelessWidget {
  const RegisterIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.tcbot.path,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 32),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: Strings.welcome, style: textTheme.headline4),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showEmailBottomSheet(context, size, textTheme);
                },
                child: const Text('بزن بریم'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.insertYourEmail,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        print(isEmail(value));
                      },
                      style: textTheme.headline5,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'TechBlog@gmail.com',
                          hintStyle: textTheme.headline5),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _showActivateCodeBottomSheet(context, size, textTheme);
                    },
                    child: const Text('ادامه'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _showActivateCodeBottomSheet(BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.activateCode,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {

                      },
                      style: textTheme.headline5,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: '******',
                          hintStyle: textTheme.headline5),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const CategoriesScreen(),));
                    },
                    child: const Text('ادامه'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}
