import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService {
  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-type'] = 'application/json';
    dio.interceptors.add(PrettyDioLogger());
    return await dio
        .get(
      url,
      options: Options(responseType: ResponseType.json, method: 'GET'),
    )
        .then(
      (response) {
        return response;
      },
    ).catchError((e){
      if(e is DioError){
        return e.response!;
      }
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-type'] = 'application/json';
    dio.interceptors.add(PrettyDioLogger());
    //Todo read token user from storage

    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then(
      (response) {
        return response;
      },
    ).catchError((e){
      if(e is DioError){
        return e.response!;
      }
    });
  }
}
