// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageRequestModel _$MessageRequestModelFromJson(Map<String, dynamic> json) =>
    MessageRequestModel(
      model: json['model'] as String? ?? "gpt-3.5-turbo",
      temperature: json['temperature'] as int? ?? 0,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageRequestModelToJson(
        MessageRequestModel instance) =>
    <String, dynamic>{
      'model': instance.model,
      'temperature': instance.temperature,
      'messages': instance.messages,
    };
