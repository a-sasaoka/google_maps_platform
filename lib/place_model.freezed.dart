// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Prediction _$PredictionFromJson(Map<String, dynamic> json) {
  return _Prediction.fromJson(json);
}

/// @nodoc
mixin _$Prediction {
  List<Description>? get predictions => throw _privateConstructorUsedError;

  /// Serializes this Prediction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Prediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PredictionCopyWith<Prediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionCopyWith<$Res> {
  factory $PredictionCopyWith(
          Prediction value, $Res Function(Prediction) then) =
      _$PredictionCopyWithImpl<$Res, Prediction>;
  @useResult
  $Res call({List<Description>? predictions});
}

/// @nodoc
class _$PredictionCopyWithImpl<$Res, $Val extends Prediction>
    implements $PredictionCopyWith<$Res> {
  _$PredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Prediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictions = freezed,
  }) {
    return _then(_value.copyWith(
      predictions: freezed == predictions
          ? _value.predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<Description>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredictionImplCopyWith<$Res>
    implements $PredictionCopyWith<$Res> {
  factory _$$PredictionImplCopyWith(
          _$PredictionImpl value, $Res Function(_$PredictionImpl) then) =
      __$$PredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Description>? predictions});
}

/// @nodoc
class __$$PredictionImplCopyWithImpl<$Res>
    extends _$PredictionCopyWithImpl<$Res, _$PredictionImpl>
    implements _$$PredictionImplCopyWith<$Res> {
  __$$PredictionImplCopyWithImpl(
      _$PredictionImpl _value, $Res Function(_$PredictionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Prediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictions = freezed,
  }) {
    return _then(_$PredictionImpl(
      predictions: freezed == predictions
          ? _value._predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<Description>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictionImpl implements _Prediction {
  const _$PredictionImpl({final List<Description>? predictions})
      : _predictions = predictions;

  factory _$PredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictionImplFromJson(json);

  final List<Description>? _predictions;
  @override
  List<Description>? get predictions {
    final value = _predictions;
    if (value == null) return null;
    if (_predictions is EqualUnmodifiableListView) return _predictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Prediction(predictions: $predictions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictionImpl &&
            const DeepCollectionEquality()
                .equals(other._predictions, _predictions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_predictions));

  /// Create a copy of Prediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictionImplCopyWith<_$PredictionImpl> get copyWith =>
      __$$PredictionImplCopyWithImpl<_$PredictionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictionImplToJson(
      this,
    );
  }
}

abstract class _Prediction implements Prediction {
  const factory _Prediction({final List<Description>? predictions}) =
      _$PredictionImpl;

  factory _Prediction.fromJson(Map<String, dynamic> json) =
      _$PredictionImpl.fromJson;

  @override
  List<Description>? get predictions;

  /// Create a copy of Prediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PredictionImplCopyWith<_$PredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Description _$DescriptionFromJson(Map<String, dynamic> json) {
  return _Description.fromJson(json);
}

/// @nodoc
mixin _$Description {
  @JsonKey(name: 'place_id')
  String? get placeId => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'structured_formatting')
  StrucuredFormatting? get structuredFormatting =>
      throw _privateConstructorUsedError;

  /// Serializes this Description to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Description
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DescriptionCopyWith<Description> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DescriptionCopyWith<$Res> {
  factory $DescriptionCopyWith(
          Description value, $Res Function(Description) then) =
      _$DescriptionCopyWithImpl<$Res, Description>;
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String? placeId,
      String? reference,
      @JsonKey(name: 'structured_formatting')
      StrucuredFormatting? structuredFormatting});

  $StrucuredFormattingCopyWith<$Res>? get structuredFormatting;
}

/// @nodoc
class _$DescriptionCopyWithImpl<$Res, $Val extends Description>
    implements $DescriptionCopyWith<$Res> {
  _$DescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Description
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = freezed,
    Object? reference = freezed,
    Object? structuredFormatting = freezed,
  }) {
    return _then(_value.copyWith(
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      structuredFormatting: freezed == structuredFormatting
          ? _value.structuredFormatting
          : structuredFormatting // ignore: cast_nullable_to_non_nullable
              as StrucuredFormatting?,
    ) as $Val);
  }

  /// Create a copy of Description
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StrucuredFormattingCopyWith<$Res>? get structuredFormatting {
    if (_value.structuredFormatting == null) {
      return null;
    }

    return $StrucuredFormattingCopyWith<$Res>(_value.structuredFormatting!,
        (value) {
      return _then(_value.copyWith(structuredFormatting: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DescriptionImplCopyWith<$Res>
    implements $DescriptionCopyWith<$Res> {
  factory _$$DescriptionImplCopyWith(
          _$DescriptionImpl value, $Res Function(_$DescriptionImpl) then) =
      __$$DescriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String? placeId,
      String? reference,
      @JsonKey(name: 'structured_formatting')
      StrucuredFormatting? structuredFormatting});

  @override
  $StrucuredFormattingCopyWith<$Res>? get structuredFormatting;
}

/// @nodoc
class __$$DescriptionImplCopyWithImpl<$Res>
    extends _$DescriptionCopyWithImpl<$Res, _$DescriptionImpl>
    implements _$$DescriptionImplCopyWith<$Res> {
  __$$DescriptionImplCopyWithImpl(
      _$DescriptionImpl _value, $Res Function(_$DescriptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Description
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = freezed,
    Object? reference = freezed,
    Object? structuredFormatting = freezed,
  }) {
    return _then(_$DescriptionImpl(
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      structuredFormatting: freezed == structuredFormatting
          ? _value.structuredFormatting
          : structuredFormatting // ignore: cast_nullable_to_non_nullable
              as StrucuredFormatting?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DescriptionImpl implements _Description {
  const _$DescriptionImpl(
      {@JsonKey(name: 'place_id') this.placeId,
      this.reference,
      @JsonKey(name: 'structured_formatting') this.structuredFormatting});

  factory _$DescriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DescriptionImplFromJson(json);

  @override
  @JsonKey(name: 'place_id')
  final String? placeId;
  @override
  final String? reference;
  @override
  @JsonKey(name: 'structured_formatting')
  final StrucuredFormatting? structuredFormatting;

  @override
  String toString() {
    return 'Description(placeId: $placeId, reference: $reference, structuredFormatting: $structuredFormatting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DescriptionImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.structuredFormatting, structuredFormatting) ||
                other.structuredFormatting == structuredFormatting));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, placeId, reference, structuredFormatting);

  /// Create a copy of Description
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DescriptionImplCopyWith<_$DescriptionImpl> get copyWith =>
      __$$DescriptionImplCopyWithImpl<_$DescriptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DescriptionImplToJson(
      this,
    );
  }
}

abstract class _Description implements Description {
  const factory _Description(
      {@JsonKey(name: 'place_id') final String? placeId,
      final String? reference,
      @JsonKey(name: 'structured_formatting')
      final StrucuredFormatting? structuredFormatting}) = _$DescriptionImpl;

  factory _Description.fromJson(Map<String, dynamic> json) =
      _$DescriptionImpl.fromJson;

  @override
  @JsonKey(name: 'place_id')
  String? get placeId;
  @override
  String? get reference;
  @override
  @JsonKey(name: 'structured_formatting')
  StrucuredFormatting? get structuredFormatting;

  /// Create a copy of Description
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DescriptionImplCopyWith<_$DescriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StrucuredFormatting _$StrucuredFormattingFromJson(Map<String, dynamic> json) {
  return _StrucuredFormatting.fromJson(json);
}

/// @nodoc
mixin _$StrucuredFormatting {
  @JsonKey(name: 'main_text')
  String? get mainText => throw _privateConstructorUsedError;

  /// Serializes this StrucuredFormatting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrucuredFormatting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrucuredFormattingCopyWith<StrucuredFormatting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrucuredFormattingCopyWith<$Res> {
  factory $StrucuredFormattingCopyWith(
          StrucuredFormatting value, $Res Function(StrucuredFormatting) then) =
      _$StrucuredFormattingCopyWithImpl<$Res, StrucuredFormatting>;
  @useResult
  $Res call({@JsonKey(name: 'main_text') String? mainText});
}

/// @nodoc
class _$StrucuredFormattingCopyWithImpl<$Res, $Val extends StrucuredFormatting>
    implements $StrucuredFormattingCopyWith<$Res> {
  _$StrucuredFormattingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrucuredFormatting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainText = freezed,
  }) {
    return _then(_value.copyWith(
      mainText: freezed == mainText
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StrucuredFormattingImplCopyWith<$Res>
    implements $StrucuredFormattingCopyWith<$Res> {
  factory _$$StrucuredFormattingImplCopyWith(_$StrucuredFormattingImpl value,
          $Res Function(_$StrucuredFormattingImpl) then) =
      __$$StrucuredFormattingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'main_text') String? mainText});
}

/// @nodoc
class __$$StrucuredFormattingImplCopyWithImpl<$Res>
    extends _$StrucuredFormattingCopyWithImpl<$Res, _$StrucuredFormattingImpl>
    implements _$$StrucuredFormattingImplCopyWith<$Res> {
  __$$StrucuredFormattingImplCopyWithImpl(_$StrucuredFormattingImpl _value,
      $Res Function(_$StrucuredFormattingImpl) _then)
      : super(_value, _then);

  /// Create a copy of StrucuredFormatting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainText = freezed,
  }) {
    return _then(_$StrucuredFormattingImpl(
      mainText: freezed == mainText
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StrucuredFormattingImpl implements _StrucuredFormatting {
  const _$StrucuredFormattingImpl({@JsonKey(name: 'main_text') this.mainText});

  factory _$StrucuredFormattingImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrucuredFormattingImplFromJson(json);

  @override
  @JsonKey(name: 'main_text')
  final String? mainText;

  @override
  String toString() {
    return 'StrucuredFormatting(mainText: $mainText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrucuredFormattingImpl &&
            (identical(other.mainText, mainText) ||
                other.mainText == mainText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mainText);

  /// Create a copy of StrucuredFormatting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrucuredFormattingImplCopyWith<_$StrucuredFormattingImpl> get copyWith =>
      __$$StrucuredFormattingImplCopyWithImpl<_$StrucuredFormattingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrucuredFormattingImplToJson(
      this,
    );
  }
}

abstract class _StrucuredFormatting implements StrucuredFormatting {
  const factory _StrucuredFormatting(
          {@JsonKey(name: 'main_text') final String? mainText}) =
      _$StrucuredFormattingImpl;

  factory _StrucuredFormatting.fromJson(Map<String, dynamic> json) =
      _$StrucuredFormattingImpl.fromJson;

  @override
  @JsonKey(name: 'main_text')
  String? get mainText;

  /// Create a copy of StrucuredFormatting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrucuredFormattingImplCopyWith<_$StrucuredFormattingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
