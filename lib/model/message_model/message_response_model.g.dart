// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponseModel _$MessageResponseModelFromJson(
        Map<String, dynamic> json) =>
    MessageResponseModel(
      createdAt: json['created'] as int?,
      temperature: json['temperature'] as int? ?? 0,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageResponseModelToJson(
        MessageResponseModel instance) =>
    <String, dynamic>{
      'created': instance.createdAt,
      'temperature': instance.temperature,
      'choices': instance.choices,
    };
