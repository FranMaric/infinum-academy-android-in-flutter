import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/constants/shared_prefs_keys.dart';
import 'package:infinum_academy_android_flutter/models/new_review.dart';
import 'package:infinum_academy_android_flutter/models/review.dart';
import 'package:infinum_academy_android_flutter/models/user.dart';
import 'package:infinum_academy_android_flutter/services/shows_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewsNotifier extends ChangeNotifier {
  final container = ProviderContainer();
  List<Review> _reviews = [];

  List<Review> get reviews => _reviews;

  Future<void> addReview(NewReview newReview, BuildContext context) async {
    context.read(showsRepositoryProvider).postReview(newReview);

    final prefs = await SharedPreferences.getInstance();

    _reviews.insert(
      0,
      Review(
        'none',
        newReview.comment,
        newReview.rating,
        newReview.showId,
        User(
          '',
          prefs.getString(prefsEmailKey) ?? '',
          prefs.getString(prefsProfilePhotoUrlKey),
        ),
      ),
    );
    notifyListeners();
  }

  Future<void> getReviews(int showId, BuildContext context) async {
    _reviews = await context.read(showsRepositoryProvider).getReviews(showId: showId);
    notifyListeners();
  }
}
