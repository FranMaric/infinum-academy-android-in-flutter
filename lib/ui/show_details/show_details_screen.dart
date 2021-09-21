import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/models/reviews_info.dart';
import 'package:infinum_academy_android_flutter/models/show.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/loading_button.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/add_review_bottom_sheet.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/reviews_notifier.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/widgets/rating_bar.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/widgets/reviews_list.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/show_image.dart';

final reviewsNotifierProvider = ChangeNotifierProvider((ref) => ReviewsNotifier());

final reviewsInfoProvider = Provider((ref) {
  final reviews = ref.watch(reviewsNotifierProvider).reviews;
  final averageRating = double.parse((reviews.map((review) => review.rating).reduce((a, b) => a + b) / reviews.length).toStringAsFixed(2));

  return ReviewsInfo(reviewsCount: reviews.length, averageRating: averageRating);
});

class ShowDetailsScreen extends StatelessWidget {
  ShowDetailsScreen({Key? key, required this.show}) : super(key: key);

  static const routeName = '/details';

  final Show show;

  final RatingController _ratingController = RatingController();

  @override
  Widget build(BuildContext context) {
    context.read(reviewsNotifierProvider).getReviews(int.parse(show.id), context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, __) => [
                SliverAppBar(
                  pinned: true,
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  ),
                  expandedHeight: 120.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    title: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        show.title,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (show.imageUrl != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ShowImage(url: show.imageUrl!),
                          ),
                        ),
                      if (show.description != null)
                        Text(
                          show.description!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      const SizedBox(height: 24.0),
                      Text(
                        'Reviews',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 16.0),
                      Consumer(
                        builder: (context, watch, child) {
                          final reviewsInfo = watch(reviewsInfoProvider);

                          _ratingController.rating = reviewsInfo.averageRating;

                          return Text(
                            '${reviewsInfo.reviewsCount} REVIEWS, ${reviewsInfo.averageRating} AVERAGE',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  letterSpacing: 0.15,
                                  color: const Color(0xFF999999),
                                ),
                          );
                        },
                      ),
                      const SizedBox(height: 6.0),
                      RatingBar(
                        ratingController: _ratingController,
                        ignoreGestures: true,
                        itemSize: 23,
                        lineWidth: 2,
                      ),
                      const ReviewsList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.all(24.0),
            child: LoadingButton(
              title: 'Write a Review',
              enabledTitleColor: Colors.white,
              enabledBackgroundColor: Theme.of(context).primaryColor,
              onPressed: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => AddReviewBottomSheet(showId: int.parse(show.id)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
