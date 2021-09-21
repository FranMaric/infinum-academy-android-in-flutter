import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  const RatingBar({
    Key? key,
    this.initialRating = 0,
    this.itemCount = 5,
    this.itemSize = 40.0,
    this.ratingController,
    this.lineWidth = 3.0,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 4.0),
    this.ignoreGestures = false,
  }) : super(key: key);

  final double initialRating;
  final double itemSize;
  final double lineWidth;
  final EdgeInsets itemPadding;
  final int itemCount;
  final RatingController? ratingController;
  final bool ignoreGestures;

  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  late RatingController ratingController;

  @override
  void initState() {
    super.initState();
    _setupRatingController();
  }

  void _setupRatingController() {
    ratingController = widget.ratingController ?? RatingController(widget.initialRating);
    ratingController.addListener(
      () => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.itemCount,
        (index) {
          final double value;
          if (index < ratingController.rating.floorToDouble()) {
            value = 1;
          } else if (index < ratingController.rating) {
            value = ratingController.rating - ratingController.rating.floorToDouble();
          } else {
            value = 0;
          }

          return Padding(
            padding: widget.itemPadding,
            child: GestureDetector(
              onTap: () {
                if (widget.ignoreGestures) return;
                ratingController.rating = index + 1;
              },
              onHorizontalDragDown: (details) {
                if (widget.ignoreGestures) return;
                ratingController.rating = index + 1;
              },
              child: CustomPaint(
                size: Size(widget.itemSize, widget.itemSize),
                painter: StarPainter(
                  color: Theme.of(context).primaryColor,
                  lineWidth: widget.lineWidth,
                  value: value,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RatingController extends ValueNotifier<double> {
  RatingController([double? rating]) : super(rating ?? 0);

  double get rating => value;

  set rating(double newValue) {
    value = newValue;
  }
}

class StarPainter extends CustomPainter {
  StarPainter({
    required this.color,
    required this.value,
    required this.lineWidth,
  }) : assert(value >= 0 && value <= 1, 'Value must be between 0 and 1 inclusive');

  final Color color;

  /// double between 0 and 1 inclusive
  final double value;

  final double lineWidth;

  /// Points of a star in a unit grid
  /// Starting at top point and going clockwise
  static const List<Offset> _points = [
    Offset(0.50, 0.00),
    Offset(0.60, 0.37),
    Offset(0.97, 0.37),
    Offset(0.68, 0.60),
    Offset(0.79, 0.97),
    Offset(0.50, 0.75),
    Offset(0.21, 0.97),
    Offset(0.32, 0.60),
    Offset(0.03, 0.37),
    Offset(0.40, 0.37),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final points = _points.map((offset) => offset.scale(size.width, size.height - lineWidth)).toList();

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    final path = Path()..addPolygon(points, true);
    canvas.drawPath(path, paint);

    if (value == 1) {
      paint.style = PaintingStyle.fill;
      canvas.drawPath(path, paint);
    } else if (value > 0.25 && value < 0.75) {
      final leftHalf = Path()..addPolygon(points.sublist(5)..add(points.first), true);

      paint.style = PaintingStyle.fill;
      canvas.drawPath(leftHalf, paint);
    }
  }

  @override
  bool shouldRepaint(StarPainter oldDelegate) {
    if (color != oldDelegate.color) {
      return true;
    }
    if (value < 0.25 && oldDelegate.value < 0.25 || // if they are both empty stars no need to repaint
        value > 0.25 && value < 0.75 && oldDelegate.value > 0.25 && oldDelegate.value < 0.75 || // if they are both half stars no need to repaint
        value > 0.75 && oldDelegate.value > 0.75) // if they are both full stars no need to repaint
    {
      return false;
    }

    return true;
  }
}
