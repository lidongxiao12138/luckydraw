import 'dart:convert';
import 'package:dio/dio.dart';

class Request {
  // 配置 Dio 实例
  static BaseOptions _options = BaseOptions(
    ///Api地址
    baseUrl: 'http://10.42.76.102:8199',
    ///打开超时时间
    connectTimeout: 50000,
    ///接收超时时间
    receiveTimeout: 30000,
  );

  // 创建 Dio 实例
  static Dio _dio = Dio(_options);

  // _request 是核心函数，所有的请求都会走这里
  static Future<T> _request<T>(String path,{String? method, Map? params, data}) async {
    // restful 请求处理
    if (params != null) {
      params.forEach((key, value) {
        if (path.indexOf(key) != -1) {
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }
    try {
      Response response = await _dio.request(path,data: data, options: Options(method: method,contentType: Headers.formUrlEncodedContentType,));
      if (response.statusCode == 200 || response.statusCode == 201) {
        ///如果请求到，则关闭弹窗动画
        /// 格式化接收到的数据
        var data = jsonDecode(response.data);
        try {
          // return data;
          /// 如果状态吗不等于0，说明错误，则进行提示
          if (data['code'] == "1") {
            return Future.error(data['msg']);
          } else if(data['code'] == "404"){

            return Future.error(data['msg']);
          }else {
            ///其他状态说明正常
            return data;
          }
        } catch (e) {
          return Future.error('解析响应数据异常2');
        }
      } else {
        _handleHttpError(response.statusCode!);
        return Future.error('HTTP错误');
      }
    } on DioError catch (e, s) {

      return Future.error(_dioError(e));
    } catch (e, s) {
      return Future.error('未知异常');
    }
  }

  // 处理 Dio 异常
  static String _dioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.receiveTimeout:
        return "服务器异常，请稍后重试！";
        break;
      case DioErrorType.sendTimeout:
        return "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.response:
        return "服务器异常，请稍后重试！";
        break;
      case DioErrorType.cancel:
        return "请求已被取消，请重新请求";
        break;
      case DioErrorType.other:
        return "网络异常，请稍后重试！";
        break;
      default:
        return "Dio异常";
    }
  }

  // 处理 Http 错误码
  static void _handleHttpError(int errorCode) {
    String message;
    switch (errorCode) {
      case 400:
        message = '请求语法错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;
      case 404:
        message = '请求出错';
        break;
      case 408:
        message = '请求超时';
        break;
      case 500:
        message = '服务器异常';
        break;
      case 501:
        message = '服务未实现';
        break;
      case 502:
        message = '网关错误';
        break;
      case 503:
        message = '服务不可用';
        break;
      case 504:
        message = '网关超时';
        break;
      case 505:
        message = 'HTTP版本不受支持';
        break;
      default:
        message = '请求失败，错误码：$errorCode';
    }
  }

  static Future<T> get<T>(String path, {Map? params}) {
    return _request(path, method: 'get', params: params);
  }

  static Future<T> post<T>(String path, {Map? params, data}) {
    return _request(path, method: 'post', params: params, data: data);
  }
// 这里只写了 get 和 post，其他的别名大家自己手动加上去就行
}