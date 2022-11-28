import 'package:get/get.dart';
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ManageArticlesController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxBool loading = false.obs;

  @override
  onInit(){
    super.onInit();
    getManageArticles();
  }

  getManageArticles() async {
    loading.value = true;
    // var response = await DioService().getMethod(
    //     ApiConstants.publishedByMe + GetStorage().read(StorageKey.userIdKey));
    var response = await DioService().getMethod(
        "${ApiConstants.publishedByMe}1");
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      articleList.clear();
      loading.value = false;
    }
  }
}
