import 'package:flutter/widgets.dart';

@immutable
class NewReview {
  const NewReview({required this.rating, required this.comment});

  final int rating;
  final String comment;

  @override
  String toString() => 'NewReview(rating: $rating, comment: $comment )';
}
