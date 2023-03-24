import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;

import '/common/config/http_config.dart';
import '../../common/constants/constants.dart';
// import '../auth/auth_service_impl.dart';
import 'http_service.dart';

const baseUrl = HttpConfig.apiBaseUrl;

enum HeaderType { secured, file, none }

class HttpServiceImpl implements HttpService {
  late Dio dio;
  // late SecureStorageService secureStorageService;
  // final _secureStorage = getx.Get.find<SecureStorageServiceImpl>();

  @override
  void init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: HttpConfig.defaultConnectionTimeOut,
        receiveTimeout: HttpConfig.defaultReceiveTimeOut,
      ),
    );
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) async {
        // if ((error.response?.statusCode == 401)) {
        //   if (await _secureStorage.isExists(key: Constants.refreshTokenKey) &&
        //       await _secureStorage.read(key: Constants.refreshTokenKey) !=
        //           null) {
        //     await refreshToken();
        //     return handler.resolve(await _retry(error.requestOptions));
        //   }
        // }
        return handler.next(error);
      },
    ));
    // dio.interceptors.addAll(
    //   [AppInterceptors()],
    // );
    // if (kDebugMode) {
    //   dio.interceptors.add(
    //     // LoggingInterceptor(),
    //   );
    // }
  }

  @override
  Future<Response> getRequest(
      {required String urlPath,
      Map<String, dynamic> data = const {},
      HeaderType? headerType = HeaderType.secured}) async {
    Response response;
    const _extra = <String, dynamic>{};

    final Map<String, dynamic> queryParameters = Map.of(data);
    queryParameters.removeWhere((key, value) => value == "" || value == null);
    try {
      response = await dio.get(
        urlPath,
        queryParameters: queryParameters,
        options: Options(
          method: 'GET',
          extra: _extra,
          headers: await getHeaders(headerType: headerType),
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void fireAndForgetGetRequest(
      String urlPath, Map<String, dynamic> data) async {
    const _extra = <String, dynamic>{};
    final Map<String, dynamic> queryParameters = Map.of(data);
    queryParameters.removeWhere((key, value) => value == "" || value == null);
    try {
      dio.get(
        urlPath,
        queryParameters: queryParameters,
        options: Options(
            method: 'GET',
            extra: _extra,
            headers: await getHeaders(headerType: HeaderType.secured)),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> postRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {},
      latencySensitive = false,
      HeaderType? headerType = HeaderType.secured}) async {
    Response response;
    const _extra = <String, dynamic>{};
    try {
      if (latencySensitive) {
        dio.options.receiveTimeout = HttpConfig.defaultReceiveTimeOut;
        dio.options.connectTimeout = HttpConfig.defaultConnectionTimeOut;
      } else {
        dio.options.receiveTimeout = HttpConfig.longReceiveTimeOut;
        dio.options.connectTimeout = HttpConfig.longConnectionTimeOut;
      }
      dynamic requestData = data;
      final Map<String, dynamic> requestDatas = Map.of(requestData);
      requestDatas.removeWhere((key, value) => value == "" || value == null);

      final Map<String, dynamic> queryParameters = Map.of(queryParam);
      queryParameters.removeWhere((key, value) => value == "" || value == null);

      FormData formData = FormData();
      if (headerType == HeaderType.file) {
        formData = FormData.fromMap(requestDatas);
      }

      response = await dio.post(
        urlPath,
        data: headerType == HeaderType.file ? formData : requestDatas,
        queryParameters: queryParameters,
        options: Options(
          extra: _extra,
          headers: await getHeaders(headerType: headerType),
        ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> patchRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {},
      latencySensitive = false,
      HeaderType? headerType = HeaderType.secured}) async {
    Response response;
    const _extra = <String, dynamic>{};
    try {
      if (latencySensitive) {
        dio.options.receiveTimeout = HttpConfig.defaultReceiveTimeOut;
        dio.options.connectTimeout = HttpConfig.defaultConnectionTimeOut;
      } else {
        dio.options.receiveTimeout = HttpConfig.longReceiveTimeOut;
        dio.options.connectTimeout = HttpConfig.longConnectionTimeOut;
      }
      dynamic requestData = data;
      final Map<String, dynamic> requestDatas = Map.of(requestData);
      requestDatas.removeWhere((key, value) => value == "" || value == null);

      final Map<String, dynamic> queryParameters = Map.of(queryParam);
      queryParameters.removeWhere((key, value) => value == "" || value == null);

      FormData formData = FormData();
      if (headerType == HeaderType.file) {
        formData = FormData.fromMap(requestDatas);
      }

      response = await dio.patch(
        urlPath,
        data: headerType == HeaderType.file ? formData : requestDatas,
        queryParameters: queryParameters,
        options: Options(
          extra: _extra,
          headers: await getHeaders(headerType: headerType),
        ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> deleteRequest(
      {required String urlPath,
      required Map<String, dynamic> data,
      Map<String, dynamic> queryParam = const {},
      latencySensitive = true,
      HeaderType? headerType = HeaderType.secured}) async {
    Response response;
    const _extra = <String, dynamic>{};
    try {
      if (latencySensitive) {
        dio.options.receiveTimeout = HttpConfig.defaultReceiveTimeOut;
        dio.options.connectTimeout = HttpConfig.defaultConnectionTimeOut;
      } else {
        dio.options.receiveTimeout = HttpConfig.longReceiveTimeOut;
        dio.options.connectTimeout = HttpConfig.longConnectionTimeOut;
      }
      dynamic requestData = data;
      if (headerType == HeaderType.file) {
        requestData = FormData.fromMap(data);
      }
      final Map<String, dynamic> requestDatas = Map.of(requestData);
      requestDatas.removeWhere((key, value) => value == "" || value == null);

      final Map<String, dynamic> queryParameters = Map.of(queryParam);
      queryParameters.removeWhere((key, value) => value == "" || value == null);

      response = await dio.delete(
        urlPath,
        data: requestDatas,
        queryParameters: queryParameters,
        options: Options(
          extra: _extra,
          headers: await getHeaders(headerType: headerType),
        ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void fireAndForgetPostRequest(
      String urlPath, Map<String, dynamic> data) async {
    const _extra = <String, dynamic>{};
    try {
      dio.post(
        urlPath,
        data: data,
        options: Options(
            extra: _extra,
            method: "POST",
            headers: await getHeaders(headerType: HeaderType.secured)),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  void fireAndForgetDeleteRequest(
      String urlPath, Map<String, dynamic> data) async {
    const _extra = <String, dynamic>{};
    try {
      dio.delete(
        urlPath,
        queryParameters: data,
        options: Options(
            extra: _extra,
            method: "DELETE",
            headers: await getHeaders(headerType: HeaderType.secured)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getHeaders({HeaderType? headerType}) async {
    // final isRegistered = getx.Get.isRegistered<AuthServiceImpl>();
    String? accessToken;
    bool? accessTokenExists;
    // if (isRegistered) {
    //   // secureStorageService = getx.Get.find<SecureStorageServiceImpl>();
    //   accessTokenExists =
    //       await secureStorageService.isExists(key: Constants.accessTokenKey);
    //   if (!accessTokenExists) {
    //     headerType = HeaderType.none;
    //   } else {
    //     accessToken =
    //         await secureStorageService.read(key: Constants.accessTokenKey);
    //   }
    // }
    switch (headerType) {
      case HeaderType.secured:
        return {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer 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"
        };
      case HeaderType.file:
        return {
          "Content-Type": "multipart/form-data",
          "Authorization":
              "Bearer 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"
        };
      case HeaderType.none:
        return {
          "Content-Type": "application/json",
        };
      default:
        return {
          "Content-Type": "application/json",
        };
    }
  }

  // Future<void> refreshToken() async {
  //   final refreshToken =
  //       await _secureStorage.read(key: Constants.refreshTokenKey);
  //   final response = await dio.post(Apis.refreshToken,
  //       options: Options(headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer $refreshToken"
  //       }));

  //   if (response.statusCode == 200) {
  //     // successfully got the new access token
  //     final accessToken = response.data["data"]["accessToken"];
  //     await _secureStorage.clear(key: Constants.accessTokenKey);
  //     await _secureStorage.write(
  //         key: Constants.accessTokenKey, value: accessToken);
  //   } else {
  //     // refresh token is wrong so log out user.
  //     getx.Get.find<AuthServiceImpl>().logout();
  //   }
  // }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    options.headers = await getHeaders(headerType: HeaderType.secured);
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
