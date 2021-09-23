import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/domain/shows_repository.dart';
import 'package:infinum_academy_android_flutter/ui/shows/profile_bottom_sheet.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/layout_fab.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/profile_photo.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/shows_list.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/top_rated_chip.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _isFirstLoad = true;

final showsFutureProvider = FutureProvider.autoDispose((ref) async {
  ref.maintainState = true;

  if (_isFirstLoad) {
    final prefs = await SharedPreferences.getInstance();
    prefs.reload();
    _isFirstLoad = false;
  }

  final showsRepository = ref.watch(showsRepositoryProvider);
  final isTopRated = ref.watch(_isTopRatedProvider).state;

  final shows = await showsRepository.getShows(isTopRated: isTopRated);

  return shows;
});

final _isTopRatedProvider = StateProvider((ref) => false);

enum ShowsLayout { column, grid }

final showsLayoutProvider = StateProvider((ref) => ShowsLayout.column);

class ShowsScreen extends StatelessWidget {
  const ShowsScreen({Key? key}) : super(key: key);

  static const routeName = '/shows';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const LayoutFAB(),
      appBar: _appBarBuilder(context),
      body: const ShowsList(),
    );
  }

  AppBar _appBarBuilder(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (_) => const ProfileBottomSheet(),
          ),
          icon: const ProfilePhoto(),
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
                ' Shows',
                style: Theme.of(context).textTheme.headline6,
              ),
              TopRatedChip(
                onPressed: (isTopRated) => context.read(_isTopRatedProvider).state = isTopRated,
              )
            ],
          ),
        ),
      ),
      toolbarHeight: 150.0,
      elevation: 0.0,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      titleTextStyle: Theme.of(context).textTheme.headline6,
    );
  }
}
