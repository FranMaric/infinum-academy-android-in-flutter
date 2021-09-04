import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/models/show.dart';
import 'package:infinum_academy_android_flutter/services/shows_exception.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/centered_circular_progress_indicator.dart';
import 'package:infinum_academy_android_flutter/ui/show_details/show_details_screen.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/no_shows_widget.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/show_tile.dart';

class ShowsList extends ConsumerWidget {
  const ShowsList({
    Key? key,
    required this.showsFutureProvider,
  }) : super(key: key);

  final AutoDisposeFutureProvider<List<Show>> showsFutureProvider;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return RefreshIndicator(
      onRefresh: () => context.refresh(showsFutureProvider),
      color: Theme.of(context).primaryColor,
      strokeWidth: 2.5,
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
            return ListView.builder(
              itemCount: shows.length,
              itemBuilder: (context, index) {
                return ShowTile(
                  show: shows[index],
                  onTap: () => Navigator.of(context).pushNamed(ShowDetailsScreen.routeName, arguments: shows[index]),
                );
              },
            );
          }),
    );
  }
}