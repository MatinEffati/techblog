import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/components/colors.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/components/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/ui/home_screen.dart';
import 'package:tech_blog/ui/profile_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  RxInt selectedIndex = 0.obs;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      Assets.images.techblog.path,
                      scale: 3,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "پروفایل کاربری",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                ListTile(
                  title: Text(
                    "درباره تک‌بلاگ",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.headline4,
                  ),
                  onTap: () async{
                    await Share.share(Strings.shareText);
                  },
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                ListTile(
                  title: Text(
                    "تک بلاگ در گیت هاب",
                    style: textTheme.headline4,
                  ),
                  onTap: () {
                    myLaunchUrl(Strings.techBlogGithubUrl);
                  },
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState?.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Assets.images.techblog.image(height: size.height / 13.6),
              const Icon(
                Icons.search,
                color: Colors.black,
              )
            ],
          ),
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Obx(() {
                return IndexedStack(
                  index: selectedIndex.value,
                  children: [
                    HomeScreen(
                        size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                    ProfileScreen(
                        size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  ],
                );
              },)
            ),
            BottomNavigation(
              changeScreen: (screen) {
                  selectedIndex.value = screen;
              },
              size: size,
              bodyMargin: bodyMargin,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.changeScreen,
    required this.size,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: size.height / 10,
        padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradiantColors.bottomNavBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          height: size.height / 8,
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(colors: GradiantColors.bottomNav)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () => changeScreen(0),
                  icon: const Icon(CupertinoIcons.house_fill,
                      color: Colors.white)),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(Image.asset(Assets.icons.write.path).image),
                color: Colors.white,
              ),
              IconButton(
                  onPressed: () => changeScreen(1),
                  icon: const Icon(CupertinoIcons.person_fill,
                      color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
