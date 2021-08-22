import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinum_academy_android_flutter/models/show.dart';
import 'package:infinum_academy_android_flutter/services/api/shows_exception.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/centered_circular_progress_indicator.dart';
import 'package:infinum_academy_android_flutter/ui/shows_screen/widgets/show_tile.dart';

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
      child: watch(showsFutureProvider).when(
          loading: () => const CenteredCircularProgressIndicator(),
          error: (e, s) {
            if (e is ShowsException) {
              return Center(
                child: Text(e.message),
              );
            }
            return const Text('Oops, something went wrong');
          },
          data: (shows) {
            if (shows.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/no_shows_icon.svg'),
                    const SizedBox(height: 26),
                    Text(
                      'Your shows are not showing. Get it?',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: shows.length,
              itemBuilder: (context, index) {
                return ShowTile(
                  show: shows[index],
                  onTap: () {
                    print(shows[index]);
                  },
                );
              },
            );
          }),
    );
  }
}
