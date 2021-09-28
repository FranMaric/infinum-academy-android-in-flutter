import 'package:flutter/widgets.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_preferences/shared_prefs_keys.dart';
import 'package:infinum_academy_android_flutter/common/models/new_review.dart';
import 'package:infinum_academy_android_flutter/common/models/review.dart';
import 'package:infinum_academy_android_flutter/common/models/user.dart';
import 'package:infinum_academy_android_flutter/domain/shows_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewsNotifier extends ChangeNotifier {
  ReviewsNotifier(this._showsRepository, this._prefs);

  final ShowsRepository _showsRepository;
  final SharedPreferences _prefs;

  List<Review> _reviews = [];

  List<Review> get reviews => _reviews;

  void addReview(NewReview newReview) {
    final review = Review(
      id: 'offline',
      comment: newReview.comment,
      rating: newReview.rating,
      showId: newReview.showId,
      user: User(
        id: '',
        email: _prefs.getString(prefsEmailKey) ?? '',
        imageUrl: _prefs.getString(prefsProfilePhotoUrlKey),
      ),
    );

    _reviews.insert(0, review);
    _showsRepository.postReview(review);

    notifyListeners();
  }

  Future<void> getReviews(int showId) async {
    _reviews = await _showsRepository.getReviews(showId: showId);
    notifyListeners();
  }
}
