import 'package:json_annotation/json_annotation.dart';
import 'package:realassistai/model/message_model/message_model.dart';

part 'choice.g.dart';

@JsonSerializable()
class Choice {
  MessageModel? message;

  Choice({
    this.message,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}
