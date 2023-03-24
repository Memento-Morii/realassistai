import 'package:json_annotation/json_annotation.dart';

import 'message_model.dart';

part 'message_request_model.g.dart';

@JsonSerializable()
class MessageRequestModel {
  String model;
  int temperature;
  List<MessageModel>? messages;

  MessageRequestModel({
    this.model = "gpt-3.5-turbo",
    this.temperature = 0,
    this.messages,
  });

  factory MessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageRequestModelToJson(this);
}
