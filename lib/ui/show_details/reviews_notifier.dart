import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_preferences/shared_prefs_keys.dart';
import 'package:infinum_academy_android_flutter/common/models/new_review.dart';
import 'package:infinum_academy_android_flutter/common/models/review.dart';
import 'package:infinum_academy_android_flutter/common/models/user.dart';
import 'package:infinum_academy_android_flutter/domain/shows_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewsNotifier extends ChangeNotifier {
  final container = ProviderContainer();
  List<Review> _reviews = [];

  List<Review> get reviews => _reviews;

  Future<void> addReview(NewReview newReview, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final review = Review(
      id: 'offline',
      comment: newReview.comment,
      rating: newReview.rating,
      showId: newReview.showId,
      user: User(
        id: '',
        email: prefs.getString(prefsEmailKey) ?? '',
        imageUrl: prefs.getString(prefsProfilePhotoUrlKey),
      ),
    );

    _reviews.insert(0, review);
    context.read(showsRepositoryProvider).postReview(review);

    notifyListeners();
  }

  Future<void> getReviews(int showId, BuildContext context) async {
    _reviews = await context.read(showsRepositoryProvider).getReviews(showId: showId);
    notifyListeners();
  }
}
