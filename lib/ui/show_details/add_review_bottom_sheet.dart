import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/loading_button.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/email_text.dart';
import 'package:infinum_academy_android_flutter/ui/shows/widgets/profile_photo.dart';

const horizontalPadding = 24.0;

final _logoutButtonStateProvider = StateProvider((ref) => ButtonState.enabled);
final _changeProfilePhotoButtonStateProvider = StateProvider((ref) => ButtonState.enabled);

class AddReviewBottomSheet extends StatelessWidget {
  const AddReviewBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              LoadingButton(
                title: 'Logout',
                buttonStateProvider: _logoutButtonStateProvider,
                enabledBackgroundColor: Theme.of(context).primaryColor,
                enabledTitleColor: Colors.white,
                loadingIndicatorColor: Colors.white,
                onPressed: () {},
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
