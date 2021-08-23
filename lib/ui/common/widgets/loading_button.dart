import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/centered_circular_progress_indicator.dart';

enum ButtonState { enabled, disabled, loading }

final defaultButtonStateProvider = StateProvider<ButtonState>((ref) => ButtonState.enabled);

class LoadingButton extends ConsumerWidget {
  const LoadingButton({
    Key? key,
    required this.onPressed,
    this.title = 'null',
    this.buttonStateProvider,
    this.disabledBackgroundColor = const Color(0xffbbbbbb),
    this.enabledBackgroundColor = const Color(0xFFFFFFFF),
    this.disabledTitleColor = const Color(0xFFFFFFFF),
    this.enabledTitleColor = const Color(0xFF52368C),
    this.loadingIndicatorColor,
    this.margin,
    this.borderColor,
    this.borderWidth = 0,
  }) : super(key: key);

  final StateProvider<ButtonState>? buttonStateProvider;

  final void Function()? onPressed;
  final String title;

  final Color disabledBackgroundColor;
  final Color enabledBackgroundColor;
  final Color disabledTitleColor;
  final Color enabledTitleColor;
  final Color? borderColor;
  final Color? loadingIndicatorColor;

  final double borderWidth;

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final ButtonState buttonState = watch(buttonStateProvider ?? defaultButtonStateProvider).state;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonState == ButtonState.enabled ? enabledBackgroundColor : disabledBackgroundColor,
        borderRadius: BorderRadius.circular(25),
        border: borderWidth != 0.0
            ? Border.all(
                color: borderColor ?? Theme.of(context).primaryColor,
                width: borderWidth,
              )
            : null,
      ),
      margin: margin,
      child: MaterialButton(
        onPressed: buttonState == ButtonState.enabled ? onPressed : null,
        child: buttonState == ButtonState.loading
            ? CenteredCircularProgressIndicator(
                color: loadingIndicatorColor,
              )
            : Text(
                title,
                style: Theme.of(context).textTheme.button?.copyWith(
                      color: buttonState == ButtonState.enabled ? enabledTitleColor : disabledTitleColor,
                    ),
              ),
      ),
    );
  }
}
