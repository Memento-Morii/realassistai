import 'package:realassistai/model/message_model/message_response_model.dart';

import '../../model/message_model/message_request_model.dart';

abstract class MessageService {
  Future<MessageResponseModel> completeText({
    required MessageRequestModel request,
  });
}
