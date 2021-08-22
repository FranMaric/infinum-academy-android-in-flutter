import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/constants/shared_prefs_keys.dart';
import 'package:infinum_academy_android_flutter/services/shows_repository.dart';
import 'package:infinum_academy_android_flutter/ui/shows_screen/widgets/shows_list.dart';
import 'package:infinum_academy_android_flutter/ui/shows_screen/widgets/top_rated_chip.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void showProfileBottomSheet() {
    // TODO: show profile bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: showProfileBottomSheet,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
              child: ClipOval(
                child: FutureBuilder<SharedPreferences>(
                    future: SharedPreferences.getInstance(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data?.getString(prefsProfilePhotoUrlKey) != null &&
                          snapshot.data?.getString(prefsProfilePhotoUrlKey) != 'null') {
                        return Image.network(snapshot.data!.getString(prefsProfilePhotoUrlKey)!);
                      }
                      return Image.asset(
                        'assets/avatar_placeholder_icon.png',
                        fit: BoxFit.fill,
                        width: 24.0,
                        height: 24.0,
                      );
                    }),
              ),
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
