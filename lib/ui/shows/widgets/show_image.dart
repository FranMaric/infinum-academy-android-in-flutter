import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/centered_circular_progress_indicator.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
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
    );
  }
}
