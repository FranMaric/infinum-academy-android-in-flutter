import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@immutable
abstract class User with _$User {
  const factory User(String id, String email,
      @JsonKey(name: 'image_url') String? imageUrl) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
