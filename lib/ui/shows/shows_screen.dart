import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinum_academy_android_flutter/services/shows_repository.dart';
import 'package:infinum_academy_android_flutter/ui/shows/profile_bottom_sheet.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/profile_photo.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/shows_list.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/top_rated_chip.dart';

final showsFutureProvider = FutureProvider.autoDispose((ref) async {
  ref.maintainState = true;

  final showsRepository = ref.read(showsRepositoryProvider);
  final shows = await showsRepository.getShows(isTopRated: ref.read(_isTopRatedProvider).state);

  return shows;
});

final _isTopRatedProvider = StateProvider((ref) => false);

enum ShowsLayout { column, grid }

final showsLayoutProvider = StateProvider((ref) => ShowsLayout.grid);

class ShowsScreen extends StatefulWidget {
  const ShowsScreen({Key? key}) : super(key: key);

  static const routeName = '/shows';

  @override
  _ShowsScreenState createState() => _ShowsScreenState();
}

class _ShowsScreenState extends State<ShowsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: pi / 2).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (context.read(showsLayoutProvider).state == ShowsLayout.column) {
            context.read(showsLayoutProvider).state = ShowsLayout.grid;
            _animationController.reverse();
          } else {
            context.read(showsLayoutProvider).state = ShowsLayout.column;
            _animationController.forward();
          }
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Transform.rotate(
            angle: _animation.value,
            child: child,
          ),
          child: SvgPicture.asset(
            'assets/images/layout_icon.svg',
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
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
                  'Shows',
                  style: Theme.of(context).textTheme.headline6,
                ),
                TopRatedChip(
                  onPressed: (isTopRated) {
                    context.read(_isTopRatedProvider).state = isTopRated;
                    context.refresh(showsFutureProvider);
                  },
                )
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
      body: const ShowsList(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
