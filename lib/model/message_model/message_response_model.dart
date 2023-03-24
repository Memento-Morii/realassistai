import 'package:json_annotation/json_annotation.dart';

import 'choice.dart';

part 'message_response_model.g.dart';

@JsonSerializable()
class MessageResponseModel {
  @JsonKey(name: "created")
  int? createdAt;
  int temperature;
  List<Choice>? choices;

  MessageResponseModel({
    this.createdAt,
    this.temperature = 0,
    this.choices,
  });

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageResponseModelToJson(this);
}
