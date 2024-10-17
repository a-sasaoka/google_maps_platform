// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

@freezed
class Prediction with _$Prediction {
  const factory Prediction({
    List<Description>? predictions,
  }) = _Prediction;

  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);
}

@freezed
class Description with _$Description {
  const factory Description({
    @JsonKey(name: 'place_id') String? placeId,
    String? reference,
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
