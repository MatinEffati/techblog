import 'package:get/get.dart';
import 'package:tech_blog/controllers/article/article_item_controller.dart';
import 'package:tech_blog/controllers/article/article_list_controller.dart';
import 'package:tech_blog/controllers/article/manage_articles_controller.dart';
import 'package:tech_blog/controllers/register_controller.dart';

class ArticleBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ArticleListController());
    Get.lazyPut(() => ArticleItemController());
  }
}

class ArticleManagerBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ManageArticlesController());
  }
}


class RegisterBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}

