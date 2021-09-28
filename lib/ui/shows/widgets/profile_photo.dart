import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_preferences/shared_preferences_provider.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_preferences/shared_prefs_keys.dart';

final profilePhotoProvider = Provider<ImageProvider>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final url = prefs.getString(prefsProfilePhotoUrlKey);

  if (url == null || url.trim().isEmpty) {
    return const AssetImage('assets/images/avatar_placeholder_icon.png');
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
    this.borderColor,
  }) : super(key: key);

  final double width;
  final double height;
  final double borderWidth;

  /// If null defaults to Theme.of(context).primaryColor
  final Color? borderColor;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: watch(profilePhotoProvider),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(
          color: borderColor ?? Theme.of(context).primaryColor,
          width: borderWidth,
        ),
      ),
    );
  }
}
