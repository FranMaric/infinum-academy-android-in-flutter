import 'package:flutter/material.dart';
import 'package:infinum_academy_android_flutter/models/review.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile(
    this.review, {
    Key? key,
    this.hasBottomDivider = false,
  }) : super(key: key);

  final Review review;
  final bool hasBottomDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: review.user.imageUrl != null
                      ? NetworkImage(review.user.imageUrl!)
                      : const AssetImage('assets/images/avatar_placeholder_icon.png') as ImageProvider,
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
            const Spacer(),
            Text(review.rating.toString()),
          ],
        ),
        Text(
          review.comment,
        ),
        if (hasBottomDivider)
          const Divider(
            color: Colors.grey,
          ),
      ],
    );
  }
}
