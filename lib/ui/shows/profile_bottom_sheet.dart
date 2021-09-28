import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinum_academy_android_flutter/domain/auth_repository.dart';
import 'package:infinum_academy_android_flutter/domain/shows_repository.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/loading_button.dart';
import 'package:infinum_academy_android_flutter/ui/login/login_screen.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/email_text.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/profile_photo.dart';
import 'package:infinum_academy_android_flutter/extensions/build_context_extension.dart';

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
    Future<void> _changeProfilePhoto() async {
      try {
        context.read(_changeProfilePhotoButtonStateProvider).state = ButtonState.loading;

        final imageSource = await _showImageSourceActionSheet(context);

        if (imageSource == null) {
          context.read(_changeProfilePhotoButtonStateProvider).state = ButtonState.enabled;
          return;
        }

        final imageXFile = await ImagePicker().pickImage(
          source: imageSource,
          maxHeight: 200,
          maxWidth: 200,
        );

        if (imageXFile == null) {
          context.read(_changeProfilePhotoButtonStateProvider).state = ButtonState.enabled;
          return;
        }

        final imageTemp = File(imageXFile.path);

        context.read(showsRepositoryProvider).uploadProfilePhoto(imageTemp).then((_) {
          context.refresh(profilePhotoProvider);
          context.read(_changeProfilePhotoButtonStateProvider).state = ButtonState.enabled;
        }).onError((error, stackTrace) {
          context.showSnackBar(error.toString());
          context.read(_changeProfilePhotoButtonStateProvider).state = ButtonState.enabled;
        });
      } on PlatformException catch (e) {
        debugPrint('Failed to pick image: ${e.message}');
        context.read(_changeProfilePhotoButtonStateProvider).state = ButtonState.enabled;
      }
    }

    Future<void> _logout() async {
      context.read(_logoutButtonStateProvider).state = ButtonState.loading;
      final shouldLogOut =
          await context.showYesNoDialog(title: 'LOGOUT', description: 'Are you sure you want to logout?', confirmText: 'LOGOUT', declineText: 'BACK');

      if (shouldLogOut != true) {
        context.read(_logoutButtonStateProvider).state = ButtonState.enabled;
        return;
      }

      final isLoggedOut = await context.read(authProvider).logout();

      if (isLoggedOut) {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      } else {
        context.showSnackBar("We couldn't logout. Try again later");
      }

      context.read(_logoutButtonStateProvider).state = ButtonState.enabled;
    }

    return Container(
      color: const Color(0xFF737373),
      child: SingleChildScrollView(
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
              const ProfilePhoto(
                width: 95.0,
                height: 95.0,
                borderWidth: 2.0,
              ),
              const SizedBox(height: 29),
              const EmailText(),
              const SizedBox(height: 62),
              LoadingButton(
                title: 'Change profile photo',
                buttonStateProvider: _changeProfilePhotoButtonStateProvider,
                disabledBackgroundColor: Colors.white,
                borderWidth: 2.0,
                onPressed: _changeProfilePhoto,
              ),
              const SizedBox(height: 16),
              LoadingButton(
                title: 'Logout',
                buttonStateProvider: _logoutButtonStateProvider,
                enabledBackgroundColor: Theme.of(context).primaryColor,
                enabledTitleColor: Colors.white,
                loadingIndicatorColor: Colors.white,
                onPressed: _logout,
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
