// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'new_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewReview _$NewReviewFromJson(Map<String, dynamic> json) {
  return _NewReview.fromJson(json);
}

/// @nodoc
class _$NewReviewTearOff {
  const _$NewReviewTearOff();

  _NewReview call(
      int rating, String comment, @JsonKey(name: 'show_id') int showId) {
    return _NewReview(
      rating,
      comment,
      showId,
    );
  }

  NewReview fromJson(Map<String, Object> json) {
    return NewReview.fromJson(json);
  }
}

/// @nodoc
const $NewReview = _$NewReviewTearOff();

/// @nodoc
mixin _$NewReview {
  int get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_id')
  int get showId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewReviewCopyWith<NewReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewReviewCopyWith<$Res> {
  factory $NewReviewCopyWith(NewReview value, $Res Function(NewReview) then) =
      _$NewReviewCopyWithImpl<$Res>;
  $Res call({int rating, String comment, @JsonKey(name: 'show_id') int showId});
}

/// @nodoc
class _$NewReviewCopyWithImpl<$Res> implements $NewReviewCopyWith<$Res> {
  _$NewReviewCopyWithImpl(this._value, this._then);

  final NewReview _value;
  // ignore: unused_field
  final $Res Function(NewReview) _then;

  @override
  $Res call({
    Object? rating = freezed,
    Object? comment = freezed,
    Object? showId = freezed,
  }) {
    return _then(_value.copyWith(
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      showId: showId == freezed
          ? _value.showId
          : showId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$NewReviewCopyWith<$Res> implements $NewReviewCopyWith<$Res> {
  factory _$NewReviewCopyWith(
          _NewReview value, $Res Function(_NewReview) then) =
      __$NewReviewCopyWithImpl<$Res>;
  @override
  $Res call({int rating, String comment, @JsonKey(name: 'show_id') int showId});
}

/// @nodoc
class __$NewReviewCopyWithImpl<$Res> extends _$NewReviewCopyWithImpl<$Res>
    implements _$NewReviewCopyWith<$Res> {
  __$NewReviewCopyWithImpl(_NewReview _value, $Res Function(_NewReview) _then)
      : super(_value, (v) => _then(v as _NewReview));

  @override
  _NewReview get _value => super._value as _NewReview;

  @override
  $Res call({
    Object? rating = freezed,
    Object? comment = freezed,
    Object? showId = freezed,
  }) {
    return _then(_NewReview(
      rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      showId == freezed
          ? _value.showId
          : showId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewReview with DiagnosticableTreeMixin implements _NewReview {
  const _$_NewReview(
      this.rating, this.comment, @JsonKey(name: 'show_id') this.showId);

  factory _$_NewReview.fromJson(Map<String, dynamic> json) =>
      _$_$_NewReviewFromJson(json);

  @override
  final int rating;
  @override
  final String comment;
  @override
  @JsonKey(name: 'show_id')
  final int showId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewReview(rating: $rating, comment: $comment, showId: $showId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NewReview'))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('showId', showId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewReview &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.showId, showId) ||
                const DeepCollectionEquality().equals(other.showId, showId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(showId);

  @JsonKey(ignore: true)
  @override
  _$NewReviewCopyWith<_NewReview> get copyWith =>
      __$NewReviewCopyWithImpl<_NewReview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NewReviewToJson(this);
  }
}

abstract class _NewReview implements NewReview {
  const factory _NewReview(
          int rating, String comment, @JsonKey(name: 'show_id') int showId) =
      _$_NewReview;

  factory _NewReview.fromJson(Map<String, dynamic> json) =
      _$_NewReview.fromJson;

  @override
  int get rating => throw _privateConstructorUsedError;
  @override
  String get comment => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'show_id')
  int get showId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewReviewCopyWith<_NewReview> get copyWith =>
      throw _privateConstructorUsedError;
}
