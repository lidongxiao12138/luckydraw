import 'package:dio/dio.dart';

class LDXHttpRequest {
  static final BaseOptions options = BaseOptions(
      baseUrl: '', connectTimeout: 50000);
  static final Dio dio = Dio(options);

  static Future<T> request<T>(String url,
      {String method = 'get', Map<String, dynamic>? params, Interceptor? inter}) async {
    // 1.请求的单独配置
    final options = Options(method: method);

    // 2.添加第一个拦截器
    Interceptor dInter = InterceptorsWrapper(
    );
    List<Interceptor> inters = [dInter];
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);

    // 3.发送网络请求
    try {
      Response response = await dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
}
