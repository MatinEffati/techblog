import 'package:get/get.dart';
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/podcart_model.dart';
import 'package:tech_blog/models/poster_model.dart';
import 'package:tech_blog/models/tag_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagModel> tagsList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxBool loading = false.obs;

  @override
  onInit(){
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {

    loading.value = true;

    var response = await DioService().getMethod(ApiConstants.getHomeItems);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      // response.data['top_podcasts'].forEach((element) async{
      //   topPodcastList.add(PodcastModel.fromJson(element));
      // });

      response.data['tags'].forEach((element) async{
        tagsList.add(TagModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);

      loading.value = false;
    }
  }
}
