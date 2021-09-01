import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/constants/shared_prefs_keys.dart';
import 'package:infinum_academy_android_flutter/services/shows_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

const placeHolderImageProvider = AssetImage('assets/avatar_placeholder_icon.png');

final profilePhotoFutureProvider = FutureProvider<ImageProvider>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final url = prefs.getString(prefsProfilePhotoUrlKey);

  if (url == null || url.trim().isEmpty) {
    throw ShowsException('Empty image url');
  }

  if (url.startsWith('http')) {
    return NetworkImage(url);
  }

  return FileImage(File(url));
});

class ProfilePhoto extends ConsumerWidget {
  const ProfilePhoto({
    Key? key,
    this.width = 24.0,
    this.height = 24.0,
    this.borderWidth = 0.0,
    this.borderColor = Colors.black,
  }) : super(key: key);

  final double width;
  final double height;
  final double borderWidth;

  final Color borderColor;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: watch(profilePhotoFutureProvider).when(
            data: (imageProvider) => imageProvider,
            loading: () => placeHolderImageProvider,
            error: (e, st) => placeHolderImageProvider,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
    );
  }
}
