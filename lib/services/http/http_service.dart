import 'package:dio/dio.dart';

import 'http_service_impl.dart';

abstract class HttpService {
  void init();

  Future<Response> getRequest({
    required String urlPath,
    Map<String, dynamic> data = const {},
    HeaderType? headerType = HeaderType.secured,
  });

  void fireAndForgetGetRequest(String urlPath, Map<String, dynamic> data);

  Future<Response> postRequest({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParam = const {},
    bool latencySensitive = true,
    HeaderType? headerType = HeaderType.secured,
  });

  Future<Response> patchRequest({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParam = const {},
    bool latencySensitive = true,
    HeaderType? headerType = HeaderType.secured,
  });
  Future<Response> deleteRequest({
    required String urlPath,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParam = const {},
    bool latencySensitive = true,
    HeaderType? headerType = HeaderType.secured,
  });

  void fireAndForgetPostRequest(
    String urlPath,
    Map<String, dynamic> data,
  );
  void fireAndForgetDeleteRequest(
    String urlPath,
    Map<String, dynamic> data,
  );
}
