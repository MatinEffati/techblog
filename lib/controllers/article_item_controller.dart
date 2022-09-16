import 'package:get/get.dart';
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class ArticleItemController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfo = ArticleInfoModel().obs;


  getArticleItem() async {
    loading.value = true;
    var userId = '';
    var response = await DioService().getMethod(
        '${ApiConstants.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfo.value = ArticleInfoModel.fromJson(response.data);

      loading.value = false;
    }
  }
}
