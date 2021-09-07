import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const fullStarAsset = 'assets/images/full_star_icon.svg';
const emptyStarAsset = 'assets/images/empty_star_icon.svg';

class RatingBar extends StatefulWidget {
  const RatingBar({
    Key? key,
    this.initialRating = 0,
    this.itemCount = 5,
    this.ratingController,
  }) : super(key: key);

  final int initialRating;
  final int itemCount;
  final RatingController? ratingController;

  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  late RatingController ratingController;

  @override
  void initState() {
    super.initState();
    if (widget.ratingController != null) {
      ratingController = widget.ratingController!;
      ratingController.addListener(
        () => setState(() {}),
      );
    } else {
      ratingController = RatingController(rating: widget.initialRating);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.itemCount,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              ratingController.rating = index + 1;
            });
          },
          child: index < ratingController.rating ? Star.full() : Star.empty(),
        ),
      ),
    );
  }
}

class Star extends StatelessWidget {
  Star.full({Key? key}) : super(key: key) {
    starAsset = fullStarAsset;
  }

  Star.empty({Key? key}) : super(key: key) {
    starAsset = emptyStarAsset;
  }

  late final String starAsset;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      starAsset,
      width: 40,
      height: 38,
      color: Theme.of(context).primaryColor,
    );
  }
}

class RatingController extends ValueNotifier<int> {
  RatingController({int? rating}) : super(rating ?? 0);

  int get rating => value;

  set rating(int newValue) {
    value = newValue;
  }
}
