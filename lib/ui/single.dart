import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/colors.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/controllers/single_article_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class Single extends StatefulWidget {
  Single({Key? key}) : super(key: key);

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  SingleArticleController singleArticleController = Get.put(SingleArticleController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleArticleController.getArticleItem();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(() => Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: singleArticleController.articleInfo.value.image!,
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
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  singleArticleController.articleInfo.value.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                      singleArticleController.articleInfo.value.author!,
                      style: textTheme.headline4,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      singleArticleController.articleInfo.value.createdAt!,
                      style: textTheme.caption,
                    ),
                  ],
                ),
              ),
              HtmlWidget(
                singleArticleController.articleInfo.value.content!,
                textStyle: textTheme.bodyText1,
                enableCaching: true,
                onLoadingBuilder: (context, element, loadingProgress) =>
                const Loading(),
              ),
              const SizedBox(
                height: 25,
              ),
              // tags(textTheme),
              // const SizedBox(
              //   height: 25,
              // ),
              // similar(textTheme),
            ],
          ),)
        ),
      ),
    );
  }
}
