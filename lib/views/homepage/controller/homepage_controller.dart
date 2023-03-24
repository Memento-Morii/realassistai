import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realassistai/helpers/utils.dart';
import 'package:realassistai/model/message_model/message.dart';
import 'package:realassistai/model/message_model/message_model.dart';
import 'package:realassistai/model/message_model/message_request_model.dart';

import '../../../services/message/message_service.dart';
import '../../../services/message/message_service_impl.dart';

class HomepageController extends GetxController {
  late TextEditingController messageController;
  RxList<Message?> messages = List<Message?>.empty(growable: true).obs;
  final MessageService _messageService = Get.find<MessageServiceImpl>();
  final List<String> questions = [
    "Creating blog content specific to real estate",
    "Creating blog content specific to real estate",
    "Creating email drip campaign content for your clients",
    "Writing answers to your clients texts/emails"
  ];
  final isSubscribe = false.obs;
  final isLoading = false.obs;
  // late OpenAI openAI;

  @override
  void onInit() {
    messageController = TextEditingController();
    // openAI = OpenAI.instance.build(
    //   token: "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",
    //   baseOption: HttpSetup(receiveTimeout: 5),
    //   isLogger: true,
    // );
    // inspect(openAI);
    // final request = CompleteText(
    //   prompt: 'What is human life expectancy in the United States?',
    //   model: kTranslateModelV3,
    //   maxTokens: 200,
    // );

    // openAI
    //     .onCompleteStream(request: request)
    //     .listen((response) => print(response))
    //     .onError((err) {
    //   print("$err");
    // });
    super.onInit();
  }

  void sendChat(String text) async {
    isLoading(true);
    try {
      if (text.isEmpty) return;
      Message newMessage = Message(
        text: text.trim(),
        dateTime: DateTime.now(),
        isMyMessage: true,
      );
      messages.add(newMessage);
      MessageRequestModel request = MessageRequestModel(
        messages: [
          MessageModel(
            content: text.trim(),
          ),
        ],
      );
      messageController.clear();
      final response = await _messageService.completeText(request: request);
      Message responseMessage = Message(
        text: response.choices![0].message!.content,
        dateTime: Utils.timestampToDate(response.createdAt ?? 10002120),
        isMyMessage: false,
      );
      messages.add(responseMessage);
      isLoading(false);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}
