import 'package:flutter/material.dart';
import 'package:tech_blog/components/colors.dart';
import 'package:tech_blog/components/components.dart';
import 'package:tech_blog/components/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            /// Poster
            Poster(size: size, textTheme: textTheme),
            const SizedBox(
              height: 16,
            ),

            /// Tag List
            TagList(bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 32,
            ),

            /// See More hottest blog
            ListHeadTitle(
                title: Strings.viewHottestBlog,
                icon: Assets.icons.pen.path,
                bodyMargin: bodyMargin,
                textTheme: textTheme),

            /// View hottest blog list
            ViewHottestBlogList(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
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
            ViewHottestPodcasts(size: size, bodyMargin: bodyMargin),
            const SizedBox(
              height: 100,
            ),
          ],
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

class ViewHottestPodcasts extends StatelessWidget {
  const ViewHottestPodcasts({
    Key? key,
    required this.size,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: blogList.getRange(0, 5).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? bodyMargin : 8,
                left: index == 4 ? bodyMargin : 8,
                top: 8),
            child: Column(
              children: [
                SizedBox(
                  width: size.width / 2.4,
                  height: size.height / 5.3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(blogList[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: size.width / 2.5,
                  child: Text(
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ViewHottestBlogList extends StatelessWidget {
  const ViewHottestBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: blogList.getRange(0, 5).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? bodyMargin : 8,
                left: index == 4 ? bodyMargin : 8,
                top: 8),
            child: Column(
              children: [
                SizedBox(
                  width: size.width / 2.4,
                  height: size.height / 5.3,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: NetworkImage(blogList[index].imageUrl),
                              fit: BoxFit.cover),
                        ),
                        foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: GradiantColors.blogPost,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            )),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              blogList[index].writer,
                              style: textTheme.subtitle1,
                            ),
                            Row(
                              children: [
                                Text(
                                  blogList[index].views,
                                  style: textTheme.subtitle1,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.white,
                                  size: 16,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: size.width / 2.5,
                  child: Text(
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                index == tagList.length - 1 ? bodyMargin : 0,
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
}

class Poster extends StatelessWidget {
  const Poster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: Image(
                image: Image.asset(homePagePosterMap['imageAsset']).image,
              ).image,
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: GradiantColors.homePosterCoverGradiant,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap['writer'] +
                        " - " +
                        homePagePosterMap['date'],
                    style: textTheme.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap['view'],
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'دوازده قدم برنامه نویسی در یک دوره ی...',
                style: textTheme.headline1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
