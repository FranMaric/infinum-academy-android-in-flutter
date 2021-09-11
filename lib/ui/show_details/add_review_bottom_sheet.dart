import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/models/new_review.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/colored_text_form_field.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/loading_button.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/widgets/rating_bar.dart';

final _submitButtonStateProvider = StateProvider((ref) => ButtonState.enabled);

class AddReviewBottomSheet extends StatelessWidget {
  AddReviewBottomSheet({Key? key}) : super(key: key) {
    _commentController = TextEditingController();
    _ratingController = RatingController();
  }

  late final TextEditingController _commentController;
  late final RatingController _ratingController;

  void _submitReview() {
    final newReview = NewReview(rating: _ratingController.rating, comment: _commentController.text);

    //TODO: submit new review
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF737373),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 40.0,
                      ),
                      child: Text(
                        'Write a review',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    child: Text(
                      'Reviews',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
                RatingBar(
                  ratingController: _ratingController,
                ),
                const SizedBox(height: 16),
                ColoredTextFormField(
                  labelText: 'Comment',
                  controller: _commentController,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 16),
                LoadingButton(
                  title: 'Submit',
                  buttonStateProvider: _submitButtonStateProvider,
                  enabledBackgroundColor: Theme.of(context).primaryColor,
                  enabledTitleColor: Colors.white,
                  loadingIndicatorColor: Colors.white,
                  onPressed: _submitReview,
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
