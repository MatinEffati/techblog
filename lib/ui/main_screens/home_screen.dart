import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/colors.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/components/strings.dart';
import 'package:tech_blog/controllers/article/article_item_controller.dart';
import 'package:tech_blog/controllers/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/ui/article/article_list_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  ArticleItemController articleItemController =
      Get.put(ArticleItemController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: homeScreenController.loading == false
                  ? Column(
                      children: [
                        /// Poster
                        poster(),
                        const SizedBox(
                          height: 16,
                        ),

                        /// Tag List
                        tags(),
                        const SizedBox(
                          height: 32,
                        ),

                        /// See More hottest blog
                        GestureDetector(
                          onTap: () => Get.to(ArticleListScreen(title: 'مقالات جدید',)),
                          child: ListHeadTitle(
                            title: Strings.viewHottestBlog,
                            icon: Assets.icons.pen.path,
                            bodyMargin: bodyMargin,
                            textTheme: textTheme,
                          ),
                        ),

                        /// View hottest blog list
                        topVisited(),
                        const SizedBox(
                          height: 32,
                        ),

                        /// See More hottest podcasts
                        ListHeadTitle(
                            title: Strings.viewHottestPodCasts,
                            icon: Assets.icons.podcast.path,
                            bodyMargin: bodyMargin,
                            textTheme: textTheme),

                        /// View hottest blog list
                        topPodcasts(),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    )
                  : SizedBox(height: Get.height / 2, child: Loading()),
            );
          },
        ));
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          foregroundDecoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: GradiantColors.homePosterCoverGradiant,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: ((context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  foregroundDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: GradiantColors.blogPost,
                    ),
                  ),
                )),
            placeholder: (context, url) => const Center(
              child: CupertinoActivityIndicator(
                color: SolidColors.primaryColor,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              size: 50,
              color: Colors.grey,
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Text(
                homeScreenController.poster.value.title!,
                style: textTheme.headline1,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.tagsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                index == tagList.length ? bodyMargin : 0,
                8,
                index == 0 ? bodyMargin : 15,
                8),
            child: TagItem(
              textTheme: textTheme,
              index: index,
            ),
          );
        },
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //blog item
            return GestureDetector(
              onTap: () {
                articleItemController.getArticleItem(
                    homeScreenController.topVisitedList[index].id);
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: index == 0 ? bodyMargin : 15,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4, top: 8),
                      child: SizedBox(
                        height: size.height / 5.3,
                        width: size.width / 2.4,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: homeScreenController
                                  .topVisitedList[index].image!,
                              imageBuilder: ((context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
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
                              placeholder: (context, url) => const Center(
                                child: Loading(),
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image_not_supported_outlined,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    homeScreenController
                                        .topVisitedList[index].author!,
                                    style: textTheme.subtitle1,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        homeScreenController
                                            .topVisitedList[index].view!,
                                        style: textTheme.subtitle1,
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
                      width: size.width / 2.4,
                      child: Text(
                        homeScreenController.topVisitedList[index].title!,
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
      ),
    );
  }

  Widget topPodcasts() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topPodcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //podcast item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4, top: 8),
                    child: SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.4,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcastList[index].poster!,
                        imageBuilder: ((context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                        placeholder: (context, url) => const Center(
                          child: Loading(),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      homeScreenController.topPodcastList[index].title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class ListHeadTitle extends StatelessWidget {
  const ListHeadTitle({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String icon;
  final String title;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Image.asset(
              icon,
            ).image,
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(title, style: textTheme.headline3),
        ],
      ),
    );
  }
}
