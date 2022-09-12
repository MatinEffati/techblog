import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/components/colors.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/components/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    Assets.images.tcbot.path,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    Strings.successfulRegistration,
                    style: textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'نام و نام خانوادگی',
                        hintStyle: textTheme.headline4),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    Strings.chooseCats,
                    style: textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  //Tag list
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.3,
                        ),
                        itemCount: tagList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if(!selectedTags.contains(tagList[index])){
                                  selectedTags.add(tagList[index]);
                                }
                              });
                            },
                            child: TagItem(
                              textTheme: textTheme,
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Image.asset(
                    Assets.icons.downCatsArrow.path,
                    scale: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedTags.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: SolidColors.surface,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectedTags[index].title,
                                    style: textTheme.headline4,
                                  ),
                                  const SizedBox(width: 12,),
                                  InkWell(onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },child: const Icon(CupertinoIcons.delete,size: 20,color: Colors.grey,))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
