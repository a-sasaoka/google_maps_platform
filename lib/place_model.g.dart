// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictionImpl _$$PredictionImplFromJson(Map<String, dynamic> json) =>
    _$PredictionImpl(
      predictions: (json['predictions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PredictionImplToJson(_$PredictionImpl instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
    };

_$DescriptionImpl _$$DescriptionImplFromJson(Map<String, dynamic> json) =>
    _$DescriptionImpl(
      placeId: json['place_id'] as String?,
      reference: json['reference'] as String?,
      structuredFormatting: json['structured_formatting'] == null
          ? null
          : StrucuredFormatting.fromJson(
              json['structured_formatting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DescriptionImplToJson(_$DescriptionImpl instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'reference': instance.reference,
      'structured_formatting': instance.structuredFormatting,
    };

_$StrucuredFormattingImpl _$$StrucuredFormattingImplFromJson(
        Map<String, dynamic> json) =>
    _$StrucuredFormattingImpl(
      mainText: json['main_text'] as String?,
    );

Map<String, dynamic> _$$StrucuredFormattingImplToJson(
        _$StrucuredFormattingImpl instance) =>
    <String, dynamic>{
      'main_text': instance.mainText,
    };
