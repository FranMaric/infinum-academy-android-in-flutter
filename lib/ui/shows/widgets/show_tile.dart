import 'package:flutter/material.dart';
import 'package:infinum_academy_android_flutter/common/models/show.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/show_image.dart';

const elevation = 5.0;
const borderRadius = 8.0;

class ShowTile extends StatelessWidget {
  const ShowTile(
    this.show, {
    Key? key,
    this.onPressed,
    this.showDescription = true,
  }) : super(key: key);

  final Show show;
  final VoidCallback? onPressed;
  final bool showDescription;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Material(
        elevation: elevation,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (show.imageUrl != null)
              SizedBox(
                height: 250.0,
                width: double.infinity,
                child: ShowImage(url: show.imageUrl!),
              ),
            Padding(
              padding: showDescription
                  ? const EdgeInsets.only(
                      top: 16.0,
                      left: 24.0,
                    )
                  : const EdgeInsets.only(
                      left: 16,
                      top: 16,
                      right: 16,
                      bottom: 40,
                    ),
              child: Text(
                show.title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            if (show.description != null && showDescription)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 14.0,
                ),
                child: Text(
                  show.description!,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
