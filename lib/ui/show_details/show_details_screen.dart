import 'package:flutter/material.dart';
import 'package:infinum_academy_android_flutter/models/show.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/loading_button.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/add_review_bottom_sheet.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/widgets/reviews_list.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/show_image.dart';

class ShowDetailsScreen extends StatelessWidget {
  const ShowDetailsScreen({Key? key, required this.show}) : super(key: key);

  static const routeName = '/details';

  final Show show;

  @override
  Widget build(BuildContext context) {
    //   context.read(_showIdProvider).state = int.parse(show.id);

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
                      ReviewsList(showId: int.parse(show.id)),
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
                builder: (_) => const AddReviewBottomSheet(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
