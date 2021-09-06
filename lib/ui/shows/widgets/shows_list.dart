import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infinum_academy_android_flutter/services/shows_exception.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/centered_circular_progress_indicator.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/show_details_screen.dart';
import 'package:infinum_academy_android_flutter/ui/shows/shows_screen.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/no_shows_widget.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/show_tile.dart';

class ShowsList extends ConsumerWidget {
  const ShowsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isColumnLayout = watch(showsLayoutProvider).state == ShowsLayout.column;

    return RefreshIndicator(
      onRefresh: () => context.refresh(showsFutureProvider),
      color: Theme.of(context).primaryColor,
      strokeWidth: 2.5,
      child: Container(
        color: Colors.white,
        child: watch(showsFutureProvider).when(
          loading: () => const CenteredCircularProgressIndicator(),
          error: (err, stack) {
            if (err is ShowsException) {
              return Center(
                child: Text(err.message),
              );
            }
            return const Text('Oops, something went wrong');
          },
          data: (shows) {
            if (shows.isEmpty) {
              return const NoShowsWidget();
            }

            if (isColumnLayout) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                itemCount: shows.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ShowTile(
                    show: shows[index],
                    onPressed: () => Navigator.of(context).pushNamed(ShowDetailsScreen.routeName, arguments: shows[index]),
                  ),
                ),
              );
            }

            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              itemCount: shows.length,
              itemBuilder: (BuildContext context, int index) => ShowTile(
                show: shows[index],
                showDescription: false,
                onPressed: () => Navigator.of(context).pushNamed(ShowDetailsScreen.routeName, arguments: shows[index]),
              ),
              staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
            );
          },
        ),
      ),
    );
  }
}
