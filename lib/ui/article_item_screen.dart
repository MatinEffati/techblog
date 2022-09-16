import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/colors.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/controllers/article_item_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class ArticleItemScreen extends StatefulWidget {
  ArticleItemScreen({Key? key}) : super(key: key);

  @override
  State<ArticleItemScreen> createState() => _ArticleItemScreenState();
}

class _ArticleItemScreenState extends State<ArticleItemScreen> {
  ArticleItemController articleItemController =
      Get.put(ArticleItemController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    articleItemController.getArticleItem();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: articleItemController.articleInfo.value.image!,
                      imageBuilder: (context, imageProvider) {
                        return Image(image: imageProvider);
                      },
                      placeholder: (context, url) => const Loading(),
                      errorWidget: (context, url, error) => Image.asset(
                        Assets.images.singlePlaceHolder.path,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: GradiantColors.singleAppbarGradiant,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24,
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            const Icon(
                              Icons.bookmark_border_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    articleItemController.articleInfo.value.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Row(
                    children: [
                      Image(
                        image:
                            Image.asset(Assets.images.profileAvatar.path).image,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        articleItemController.articleInfo.value.author!,
                        style: textTheme.headline4,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        articleItemController.articleInfo.value.createdAt!,
                        style: textTheme.caption,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: HtmlWidget(
                    articleItemController.articleInfo.value.content!,
                    textStyle: textTheme.bodyText1,
                    enableCaching: true,
                    onLoadingBuilder: (context, element, loadingProgress) =>
                        const Loading(),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                tags(textTheme),
                const SizedBox(
                  height: 25,
                ),
                similar(textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tags(texTheme) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        scrollDirection: Axis.horizontal,
        itemCount: articleItemController.tagList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () async {},
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    color: Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Text(
                    articleItemController.tagList[index].title!,
                    style: texTheme.headline2,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget similar(texTheme) {
    return SizedBox(
      height: Get.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: articleItemController.relatedList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          //blog item
          return GestureDetector(
            onTap: (() {}),
            child: Padding(
              padding: EdgeInsets.only(right: index == 0 ? Get.width / 15 : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: Get.height / 5.3,
                      width: Get.width / 2.4,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                articleItemController.relatedList[index].image!,
                            imageBuilder: ((context, imageProvider) =>
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                  foregroundDecoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: GradiantColors.blogPost,
                                    ),
                                  ),
                                )),
                            placeholder: ((context, url) => const Loading()),
                            errorWidget: ((context, url, error) => const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                )),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  articleItemController
                                      .relatedList[index].author!,
                                  style: texTheme.subtitle1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      articleItemController
                                          .relatedList[index].view!,
                                      style: texTheme.subtitle1,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 2.4,
                    child: Text(
                      articleItemController.relatedList[index].title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
