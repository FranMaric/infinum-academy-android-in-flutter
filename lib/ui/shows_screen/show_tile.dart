import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinum_academy_android_flutter/models/show.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/centered_circular_progress_indicator.dart';

const elevation = 5.0;
const margin = 15.0;
const borderRadius = 8.0;

class ShowTile extends StatelessWidget {
  const ShowTile({Key? key, required this.show, this.onTap}) : super(key: key);

  final Show show;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(margin),
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
                  child: CachedNetworkImage(
                    imageUrl: show.imageUrl!,
                    fit: BoxFit.fitWidth,
                    progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
                      height: 100.0,
                      child: CenteredCircularProgressIndicator(value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 100.0,
                      alignment: Alignment.center,
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 24.0,
                ),
                child: Text(
                  show.title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              if (show.description != null)
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
      ),
    );
  }
}
