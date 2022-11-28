import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/components/strings.dart';
import 'package:tech_blog/controllers/article/manage_articles_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ManageArticlesScreen extends StatelessWidget {
  ManageArticlesScreen({Key? key}) : super(key: key);

  var articleManageController = Get.find<ManageArticlesController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    // var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appBar('مدیریت مقاله'),
        body: Obx(
          () {
            return articleManageController.loading.value
                ? const Loading()
                : articleManageController.articleList.isNotEmpty
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: articleManageController.articleList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width / 3,
                                    height: Get.height / 6,
                                    child: CachedNetworkImage(
                                      imageUrl: articleManageController
                                          .articleList[index].image!,
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                      placeholder: (context, url) =>
                                          const Loading(),
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
                                          articleManageController
                                              .articleList[index].title!,
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
                                          Text(articleManageController
                                              .articleList[index].author!),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "${articleManageController.articleList[index].view!} بازدید",
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
                      )
                    : articleEmptyState(textTheme);
          },
        ),
      ),
    );
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.emptyState.path,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 32),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: Strings.articleEmpty, style: textTheme.headline4),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('بریم برای نوشتن یه مقاله باحال'),
          ),
        ],
      ),
    );
  }
}
