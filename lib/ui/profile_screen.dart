import 'package:flutter/material.dart';
import 'package:tech_blog/colors.dart';
import 'package:tech_blog/components.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: Image.asset(Assets.images.profileAvatar.path).image,
            height: 100,
          ),
          const SizedBox(height: 32,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(Image.asset(Assets.icons.pen.path).image,color: SolidColors.seeMore,),
              const SizedBox(width: 8,),
              Text(Strings.imageProfileEdit,style: textTheme.headline3,)
            ],
          ),
          const SizedBox(height: 64,),
          Text('متین عفتی',style: textTheme.headline4,),
          Text('Telecleverguy@gmail.com',style: textTheme.headline4,),
          const SizedBox(height: 40,),
          TechDivider(size: size),
          InkWell(
            splashColor: SolidColors.primaryColor,
            onTap: () {

            },
            child: SizedBox(height: 45,child: Center(child: Text(Strings.myFavBlog,style: textTheme.headline4,))),
          ),
          TechDivider(size: size),
          InkWell(
            splashColor: SolidColors.primaryColor,
            onTap: () {

            },
            child: SizedBox(height: 45,child: Center(child: Text(Strings.myFavPodcast,style: textTheme.headline4,))),
          ),
          TechDivider(size: size),
          InkWell(
            splashColor: SolidColors.primaryColor,
            onTap: () {

            },
            child: SizedBox(height: 45,child: Center(child: Text(Strings.logOut,style: textTheme.headline4,))),
          ),
          const SizedBox(height: 60,),
        ],
      ),
    );
  }
}
