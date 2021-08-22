import 'package:flutter/material.dart';
import 'package:infinum_academy_android_flutter/constants/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePhoto extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          final isAvailableNetworkImage = snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data?.getString(prefsProfilePhotoUrlKey) != null &&
              snapshot.data?.getString(prefsProfilePhotoUrlKey) != 'null';

          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: isAvailableNetworkImage
                  ? DecorationImage(
                      image: NetworkImage(snapshot.data!.getString(prefsProfilePhotoUrlKey)!),
                      fit: BoxFit.cover,
                    )
                  : const DecorationImage(
                      image: AssetImage('assets/avatar_placeholder_icon.png'),
                      fit: BoxFit.cover,
                    ),
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: borderColor,
                width: borderWidth,
              ),
            ),
          );
        });
  }
}
