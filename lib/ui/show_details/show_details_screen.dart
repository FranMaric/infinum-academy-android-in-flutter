import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/models/review.dart';
import 'package:infinum_academy_android_flutter/models/show.dart';
import 'package:infinum_academy_android_flutter/services/shows_repository.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/loading_button.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/widgets/reviews_list.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/show_image.dart';

final reviewsFutureProvider = FutureProvider.autoDispose((ref) async {
  ref.maintainState = true; // remove maybe?

  final showId = ref.watch(_showIdProvider).state;
  if (showId == null) return <Review>[];

  final showsRepository = ref.read(showsRepositoryProvider);
  final reviews = await showsRepository.getReviews(showId: showId);

  return reviews;
});

final _showIdProvider = StateProvider<int?>((ref) => 106);

class ShowDetailsScreen extends StatelessWidget {
  const ShowDetailsScreen({Key? key, required this.show}) : super(key: key);

  static const routeName = '/details';

  final Show show;

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 2)).then((value) {
    //   context.read(_showIdProvider).state = int.parse(show.id);
    // });

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
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (show.imageUrl != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ShowImage(url: show.imageUrl!),
                          ),
                        ),
                      if (show.description != null) Text(show.description!),
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
              onPressed: () {
                //TODO: open review bottom sheet
              },
            ),
          )
        ],
      ),
    );
  }
}
