import 'package:flutter/material.dart';
import 'package:infinum_academy_android_flutter/ui/shows_screen/widgets/profile_photo.dart';

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfilePhoto(
            width: 95.0,
            height: 95.0,
            borderWidth: 2.0,
            borderColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
