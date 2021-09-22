// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reviews_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReviewsInfoTearOff {
  const _$ReviewsInfoTearOff();

  _ReviewsInfo call(
      {required int reviewsCount, required double averageRating}) {
    return _ReviewsInfo(
      reviewsCount: reviewsCount,
      averageRating: averageRating,
    );
  }
}

/// @nodoc
const $ReviewsInfo = _$ReviewsInfoTearOff();

/// @nodoc
mixin _$ReviewsInfo {
  int get reviewsCount => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewsInfoCopyWith<ReviewsInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsInfoCopyWith<$Res> {
  factory $ReviewsInfoCopyWith(
          ReviewsInfo value, $Res Function(ReviewsInfo) then) =
      _$ReviewsInfoCopyWithImpl<$Res>;
  $Res call({int reviewsCount, double averageRating});
}

/// @nodoc
class _$ReviewsInfoCopyWithImpl<$Res> implements $ReviewsInfoCopyWith<$Res> {
  _$ReviewsInfoCopyWithImpl(this._value, this._then);

  final ReviewsInfo _value;
  // ignore: unused_field
  final $Res Function(ReviewsInfo) _then;

  @override
  $Res call({
    Object? reviewsCount = freezed,
    Object? averageRating = freezed,
  }) {
    return _then(_value.copyWith(
      reviewsCount: reviewsCount == freezed
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: averageRating == freezed
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$ReviewsInfoCopyWith<$Res>
    implements $ReviewsInfoCopyWith<$Res> {
  factory _$ReviewsInfoCopyWith(
          _ReviewsInfo value, $Res Function(_ReviewsInfo) then) =
      __$ReviewsInfoCopyWithImpl<$Res>;
  @override
  $Res call({int reviewsCount, double averageRating});
}

/// @nodoc
class __$ReviewsInfoCopyWithImpl<$Res> extends _$ReviewsInfoCopyWithImpl<$Res>
    implements _$ReviewsInfoCopyWith<$Res> {
  __$ReviewsInfoCopyWithImpl(
      _ReviewsInfo _value, $Res Function(_ReviewsInfo) _then)
      : super(_value, (v) => _then(v as _ReviewsInfo));

  @override
  _ReviewsInfo get _value => super._value as _ReviewsInfo;

  @override
  $Res call({
    Object? reviewsCount = freezed,
    Object? averageRating = freezed,
  }) {
    return _then(_ReviewsInfo(
      reviewsCount: reviewsCount == freezed
          ? _value.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: averageRating == freezed
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ReviewsInfo with DiagnosticableTreeMixin implements _ReviewsInfo {
  const _$_ReviewsInfo(
      {required this.reviewsCount, required this.averageRating});

  @override
  final int reviewsCount;
  @override
  final double averageRating;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReviewsInfo(reviewsCount: $reviewsCount, averageRating: $averageRating)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReviewsInfo'))
      ..add(DiagnosticsProperty('reviewsCount', reviewsCount))
      ..add(DiagnosticsProperty('averageRating', averageRating));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReviewsInfo &&
            (identical(other.reviewsCount, reviewsCount) ||
                const DeepCollectionEquality()
                    .equals(other.reviewsCount, reviewsCount)) &&
            (identical(other.averageRating, averageRating) ||
                const DeepCollectionEquality()
                    .equals(other.averageRating, averageRating)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reviewsCount) ^
      const DeepCollectionEquality().hash(averageRating);

  @JsonKey(ignore: true)
  @override
  _$ReviewsInfoCopyWith<_ReviewsInfo> get copyWith =>
      __$ReviewsInfoCopyWithImpl<_ReviewsInfo>(this, _$identity);
}

abstract class _ReviewsInfo implements ReviewsInfo {
  const factory _ReviewsInfo(
      {required int reviewsCount,
      required double averageRating}) = _$_ReviewsInfo;

  @override
  int get reviewsCount => throw _privateConstructorUsedError;
  @override
  double get averageRating => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReviewsInfoCopyWith<_ReviewsInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
