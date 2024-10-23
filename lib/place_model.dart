// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
class Prediction with _$Prediction {
  const factory Prediction({
    @JsonKey(name: 'predictions') List<Description>? description,
  }) = _Prediction;

  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);
}

@freezed
class Description with _$Description {
  const factory Description({
    @JsonKey(name: 'place_id') String? placeId,
    @JsonKey(name: 'structured_formatting')
    StrucuredFormatting? structuredFormatting,
  }) = _Description;

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);
}

@freezed
class StrucuredFormatting with _$StrucuredFormatting {
  const factory StrucuredFormatting({
    @JsonKey(name: 'main_text') String? mainText,
  }) = _StrucuredFormatting;

  factory StrucuredFormatting.fromJson(Map<String, dynamic> json) =>
      _$StrucuredFormattingFromJson(json);
}

@freezed
class LatLon with _$LatLon {
  const factory LatLon({
    @JsonKey(name: 'lat') double? lat,
    @JsonKey(name: 'lng') double? lng,
  }) = _LatLon;

  factory LatLon.fromJson(Map<String, dynamic> json) => _$LatLonFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    @JsonKey(name: 'location') LatLon? latLon,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Geometry with _$Geometry {
  const factory Geometry({
    @JsonKey(name: 'geometry') Location? location,
  }) = _Geometry;

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    @JsonKey(name: 'result') Geometry? geometry,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
