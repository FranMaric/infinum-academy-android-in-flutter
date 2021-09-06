import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<bool?> showYesNoDialog({
    required String title,
    required String description,
    String confirmText = 'YES',
    String declineText = 'NO',
  }) async {
    return showDialog<bool>(
      context: this,
      builder: (context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(description),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(confirmText),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(declineText),
              ),
            ],
          );
        }
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          content: Text(
            description,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                declineText,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                confirmText,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
