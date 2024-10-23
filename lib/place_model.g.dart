// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictionImpl _$$PredictionImplFromJson(Map<String, dynamic> json) =>
    _$PredictionImpl(
      description: (json['predictions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PredictionImplToJson(_$PredictionImpl instance) =>
    <String, dynamic>{
      'predictions': instance.description,
    };

_$DescriptionImpl _$$DescriptionImplFromJson(Map<String, dynamic> json) =>
    _$DescriptionImpl(
      placeId: json['place_id'] as String?,
      structuredFormatting: json['structured_formatting'] == null
          ? null
          : StrucuredFormatting.fromJson(
              json['structured_formatting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DescriptionImplToJson(_$DescriptionImpl instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
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

_$LatLonImpl _$$LatLonImplFromJson(Map<String, dynamic> json) => _$LatLonImpl(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LatLonImplToJson(_$LatLonImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      latLon: json['location'] == null
          ? null
          : LatLon.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'location': instance.latLon,
    };

_$GeometryImpl _$$GeometryImplFromJson(Map<String, dynamic> json) =>
    _$GeometryImpl(
      location: json['geometry'] == null
          ? null
          : Location.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeometryImplToJson(_$GeometryImpl instance) =>
    <String, dynamic>{
      'geometry': instance.location,
    };

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      geometry: json['result'] == null
          ? null
          : Geometry.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'result': instance.geometry,
    };
