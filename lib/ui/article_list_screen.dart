import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/controllers/article_controller.dart';
import 'package:tech_blog/controllers/single_article_controller.dart';
import 'package:tech_blog/ui/single.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({Key? key}) : super(key: key);

  ArticleListController articleController = Get.put(ArticleListController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
          appBar: appBar('مقالات جدید'),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Obx(
                () => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: articleController.articleList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        singleArticleController.id.value = int.parse(
                            articleController.articleList[index].id.toString());
                        Get.to(Single());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width / 3,
                              height: Get.height / 6,
                              child: CachedNetworkImage(
                                imageUrl:
                                    articleController.articleList[index].image!,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                                placeholder: (context, url) => const Loading(),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width / 2,
                                  child: Text(
                                    articleController.articleList[index].title!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(articleController
                                        .articleList[index].author!),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "${articleController.articleList[index].view!} بازدید",
                                      style: textTheme.caption,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )),
    );
  }
}
