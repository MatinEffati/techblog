import 'package:get/get.dart';
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ArticleListController extends GetxController {
  RxList<ArticleModel> articleList = RxList();

  RxBool loading = false.obs;

  @override
  onInit(){
    super.onInit();
    getList();
  }

  getList() async {

    loading.value = true;
    //TODO get user id from get storage +  user id
    var response = await DioService().getMethod(ApiConstants.getArticleList);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }

  getArticleListWithTagId(String id) async {
    articleList.clear();
    loading.value = true;
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    var response = await DioService().getMethod('${ApiConstants.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}