import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-type'] = 'application/json';
    dio.interceptors.add(PrettyDioLogger());
    return await dio.get(
      url,
      options: Options(responseType: ResponseType.json, method: 'GET'),
    ).then(
      (response) {
        return response;
      },
    );
  }
}
