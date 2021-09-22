// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'show.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Show _$ShowFromJson(Map<String, dynamic> json) {
  return _Show.fromJson(json);
}

/// @nodoc
class _$ShowTearOff {
  const _$ShowTearOff();

  _Show call(
      {required String id,
      @JsonKey(name: 'average_rating') required double? averageRating,
      required String? description,
      @JsonKey(name: 'image_url') required String? imageUrl,
      @JsonKey(name: 'no_of_reviews') required int noOfReviews,
      required String title}) {
    return _Show(
      id: id,
      averageRating: averageRating,
      description: description,
      imageUrl: imageUrl,
      noOfReviews: noOfReviews,
      title: title,
    );
  }

  Show fromJson(Map<String, Object> json) {
    return Show.fromJson(json);
  }
}

/// @nodoc
const $Show = _$ShowTearOff();

/// @nodoc
mixin _$Show {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_rating')
  double? get averageRating => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_of_reviews')
  int get noOfReviews => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowCopyWith<Show> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowCopyWith<$Res> {
  factory $ShowCopyWith(Show value, $Res Function(Show) then) =
      _$ShowCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'average_rating') double? averageRating,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'no_of_reviews') int noOfReviews,
      String title});
}

/// @nodoc
class _$ShowCopyWithImpl<$Res> implements $ShowCopyWith<$Res> {
  _$ShowCopyWithImpl(this._value, this._then);

  final Show _value;
  // ignore: unused_field
  final $Res Function(Show) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? averageRating = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? noOfReviews = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: averageRating == freezed
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfReviews: noOfReviews == freezed
          ? _value.noOfReviews
          : noOfReviews // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ShowCopyWith<$Res> implements $ShowCopyWith<$Res> {
  factory _$ShowCopyWith(_Show value, $Res Function(_Show) then) =
      __$ShowCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'average_rating') double? averageRating,
      String? description,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'no_of_reviews') int noOfReviews,
      String title});
}

/// @nodoc
class __$ShowCopyWithImpl<$Res> extends _$ShowCopyWithImpl<$Res>
    implements _$ShowCopyWith<$Res> {
  __$ShowCopyWithImpl(_Show _value, $Res Function(_Show) _then)
      : super(_value, (v) => _then(v as _Show));

  @override
  _Show get _value => super._value as _Show;

  @override
  $Res call({
    Object? id = freezed,
    Object? averageRating = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? noOfReviews = freezed,
    Object? title = freezed,
  }) {
    return _then(_Show(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: averageRating == freezed
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfReviews: noOfReviews == freezed
          ? _value.noOfReviews
          : noOfReviews // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Show with DiagnosticableTreeMixin implements _Show {
  const _$_Show(
      {required this.id,
      @JsonKey(name: 'average_rating') required this.averageRating,
      required this.description,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'no_of_reviews') required this.noOfReviews,
      required this.title});

  factory _$_Show.fromJson(Map<String, dynamic> json) => _$$_ShowFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'average_rating')
  final double? averageRating;
  @override
  final String? description;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'no_of_reviews')
  final int noOfReviews;
  @override
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Show(id: $id, averageRating: $averageRating, description: $description, imageUrl: $imageUrl, noOfReviews: $noOfReviews, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Show'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('averageRating', averageRating))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('noOfReviews', noOfReviews))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Show &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.averageRating, averageRating) ||
                const DeepCollectionEquality()
                    .equals(other.averageRating, averageRating)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.noOfReviews, noOfReviews) ||
                const DeepCollectionEquality()
                    .equals(other.noOfReviews, noOfReviews)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(averageRating) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(noOfReviews) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$ShowCopyWith<_Show> get copyWith =>
      __$ShowCopyWithImpl<_Show>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShowToJson(this);
  }
}

abstract class _Show implements Show {
  const factory _Show(
      {required String id,
      @JsonKey(name: 'average_rating') required double? averageRating,
      required String? description,
      @JsonKey(name: 'image_url') required String? imageUrl,
      @JsonKey(name: 'no_of_reviews') required int noOfReviews,
      required String title}) = _$_Show;

  factory _Show.fromJson(Map<String, dynamic> json) = _$_Show.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'average_rating')
  double? get averageRating => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'no_of_reviews')
  int get noOfReviews => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShowCopyWith<_Show> get copyWith => throw _privateConstructorUsedError;
}
