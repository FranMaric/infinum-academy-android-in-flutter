import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinum_academy_android_flutter/services/authentication_client.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/loading_button.dart';
import 'package:infinum_academy_android_flutter/ui/login_screen/login_screen.dart';
import 'package:infinum_academy_android_flutter/ui/shows_screen/widgets/email_text.dart';
import 'package:infinum_academy_android_flutter/ui/shows_screen/widgets/profile_photo.dart';

const horizontalPadding = 24.0;

final _logoutButtonStateProvider = StateProvider((ref) => ButtonState.enabled);
final _changeProfilePhotoButtonStateProvider = StateProvider((ref) => ButtonState.enabled);

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({Key? key}) : super(key: key);

  Future<ImageSource?> _showImageSourceActionSheet(BuildContext context) {
    if (Platform.isIOS) {
      return showCupertinoModalPopup<ImageSource>(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context, ImageSource.camera),
              child: const Text('Camera'),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
              child: const Text('Gallery'),
            )
          ],
        ),
      );
    } else {
      return showModalBottomSheet<ImageSource>(
        context: context,
        builder: (context) => Wrap(children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () => Navigator.pop(context, ImageSource.camera),
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text('Gallery'),
            onTap: () => Navigator.pop(context, ImageSource.gallery),
          ),
        ]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF737373),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 44),
            ProfilePhoto(
              width: 95.0,
              height: 95.0,
              borderWidth: 2.0,
              borderColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 29),
            const EmailText(),
            const SizedBox(height: 62),
            LoadingButton(
              title: 'Change profile photo',
              buttonStateProvider: _changeProfilePhotoButtonStateProvider,
              disabledBackgroundColor: Colors.white,
              borderWidth: 2.0,
              onPressed: () async {
                context.read(_changeProfilePhotoButtonStateProvider).state = ButtonState.loading;

                // final path = (await getApplicationDocumentsDirectory()).path;
                // final imagePath = '$path/profile_photo.png';

                final imageSource = await _showImageSourceActionSheet(context);

                if (imageSource == null) {
                  context.read(_changeProfilePhotoButtonStateProvider).state = ButtonState.enabled;
                  return;
                }

                // final imageXFile = await ImagePicker().pickImage(source: ImageSource.camera);

                // if (imageXFile != null) {
                //   imageXFile;
                // }

                context.read(_changeProfilePhotoButtonStateProvider).state = ButtonState.enabled;
              },
            ),
            const SizedBox(height: 16),
            LoadingButton(
              title: 'Logout',
              buttonStateProvider: _logoutButtonStateProvider,
              enabledBackgroundColor: Theme.of(context).primaryColor,
              enabledTitleColor: Colors.white,
              loadingIndicatorColor: Colors.white,
              onPressed: () {
                context.read(_logoutButtonStateProvider).state = ButtonState.loading;
                context.read(authProvider).logout().then((isLoggedOut) {
                  if (isLoggedOut) {
                    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                  } else {
                    context.read(_logoutButtonStateProvider).state = ButtonState.enabled;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("We couldn't logout. Try again later"),
                      ),
                    );
                  }
                });
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
