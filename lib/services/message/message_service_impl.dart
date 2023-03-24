import 'package:get/get.dart';
import 'package:realassistai/model/message_model/message_response_model.dart';
import 'package:realassistai/model/message_model/message_request_model.dart';

import '../apis.dart';
import '../http/http_service_impl.dart';
import 'message_service.dart';

class MessageServiceImpl extends MessageService {
  final _httpService = Get.find<HttpServiceImpl>();

  @override
  Future<MessageResponseModel> completeText(
      {required MessageRequestModel request}) async {
    try {
      final response = await _httpService.postRequest(
        urlPath: Apis.completions,
        data: request.toJson(),
        headerType: HeaderType.secured,
      );
      final parsedResponse = MessageResponseModel.fromJson(response.data);
      return parsedResponse;
    } catch (e) {
      rethrow;
    }
  }
}
