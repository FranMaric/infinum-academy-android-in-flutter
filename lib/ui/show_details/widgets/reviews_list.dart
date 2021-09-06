import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/services/shows_exception.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/centered_circular_progress_indicator.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/show_details_screen.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/widgets/review_tile.dart';

class ReviewsList extends ConsumerWidget {
  const ReviewsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(reviewsFutureProvider).when(
        data: (reviews) {
          if (reviews.isEmpty) {
            return const Text('No reviews yet.');
          }

          return ListView.builder(
            itemCount: reviews.length,
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ReviewTile(
              reviews[index],
            ),
          );
        },
        loading: () => const CenteredCircularProgressIndicator(),
        error: (err, stack) {
          if (err is ShowsException) {
            return Text(err.message);
          }
          return const Text('Something went wrong');
        });
  }
}
