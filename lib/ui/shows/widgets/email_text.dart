import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_preferences/shared_preferences_provider.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_preferences/shared_prefs_keys.dart';

class EmailText extends ConsumerWidget {
  const EmailText({
    Key? key,
    this.style,
  }) : super(key: key);

  final TextStyle? style;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final prefs = watch(sharedPreferencesProvider);

    return Text(
      prefs.getString(prefsEmailKey) ?? '',
      style: style ?? Theme.of(context).textTheme.caption,
    );
  }
}
