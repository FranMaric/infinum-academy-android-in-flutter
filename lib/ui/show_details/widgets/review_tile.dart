import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinum_academy_android_flutter/common/models/review.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
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
              const SizedBox(width: 18.0),
              Text(
                review.user.email.split('@').first,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const Spacer(),
              Text(
                review.rating.toString(),
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(width: 1.0),
              SvgPicture.asset('assets/images/full_star_icon.svg'),
            ],
          ),
          const SizedBox(height: 17.0),
          if (review.comment.isNotEmpty)
            Text(
              review.comment,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          if (review.comment.isNotEmpty) const SizedBox(height: 17.0),
          if (hasBottomDivider)
            const Divider(
              color: Color(0xFFC8C7CC),
              height: 0.5,
            ),
        ],
      ),
    );
  }
}
