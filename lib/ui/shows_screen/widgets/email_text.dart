import 'package:flutter/material.dart';
import 'package:infinum_academy_android_flutter/constants/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailText extends StatelessWidget {
  const EmailText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snap) {
          if (snap.hasData && snap.data?.getString(prefsEmailKey) != null && snap.data?.getString(prefsEmailKey) != 'null') {
            return Text(
              snap.data!.getString(prefsEmailKey)!,
              style: Theme.of(context).textTheme.caption,
            );
          }
          return const Text('');
        });
  }
}
