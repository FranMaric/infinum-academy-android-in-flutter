import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/services/shows_repository.dart';
import 'package:infinum_academy_android_flutter/ui/shows/profile_bottom_sheet.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/profile_photo.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/shows_list.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/top_rated_chip.dart';

final _showsFutureProvider = FutureProvider.autoDispose((ref) async {
  ref.maintainState = true;

  final showsRepository = ref.read(showsRepositoryProvider);
  final shows = await showsRepository.getShows(isTopRated: ref.read(_isTopRatedProvider).state);

  return shows;
});

final _isTopRatedProvider = StateProvider((ref) => false);

class ShowsScreen extends StatelessWidget {
  const ShowsScreen({Key? key}) : super(key: key);

  static const routeName = '/shows';

  @override
  Widget build(BuildContext context) {
    void showProfileBottomSheet(BuildContext context) {
      // TODO: show profile bottom sheet
      showModalBottomSheet(
        context: context,
        builder: (_) => const ProfileBottomSheet(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () => showProfileBottomSheet(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
              child: ProfilePhoto(),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(75.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shows',
                  style: Theme.of(context).textTheme.headline6,
                ),
                TopRatedChip(onPressed: (isTopRated) {
                  context.read(_isTopRatedProvider).state = isTopRated;
                  context.refresh(_showsFutureProvider);
                })
              ],
            ),
          ),
        ),
        toolbarHeight: 150.0,
        elevation: 0.0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        textTheme: Theme.of(context).textTheme,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ),
      body: ShowsList(showsFutureProvider: _showsFutureProvider),
    );
  }
}
