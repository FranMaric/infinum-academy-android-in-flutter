import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinum_academy_android_flutter/services/authentication_client.dart';
import 'package:infinum_academy_android_flutter/ui/common/no_glow_scroll_behavior.dart';
import 'package:infinum_academy_android_flutter/ui/common/validators/email_validator.dart';
import 'package:infinum_academy_android_flutter/ui/common/validators/password_validator.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/colored_text_form_field.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/loading_button.dart';
import 'package:infinum_academy_android_flutter/ui/login_screen/login_screen.dart';

const horizontalMargin = 20.0;

final _registerButtonStateProvider = StateProvider<ButtonState>((ref) => ButtonState.disabled);

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static const routeName = '/register';

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void checkIfValidFormAndUpdateRegisterButtonState() {
      if (registerPasswordValidator(_passwordController.text) == null && emailValidator(_emailController.text) == null) {
        context.read(_registerButtonStateProvider).state = ButtonState.enabled;
      } else if (context.read(_registerButtonStateProvider).state == ButtonState.enabled) {
        context.read(_registerButtonStateProvider).state = ButtonState.disabled;
      }
    }

    void showSnackBarNotification(String text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset("assets/images/top_left_illustration.svg"),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset("assets/images/top_right_illustration.svg"),
              ),
              SizedBox.expand(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: horizontalMargin),
                  margin: const EdgeInsets.only(bottom: 85),
                  alignment: Alignment.center,
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: SingleChildScrollView(
                      child: Form(
                        onChanged: checkIfValidFormAndUpdateRegisterButtonState,
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                bottom: 60,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset("assets/images/triangle_icon.svg"),
                                  const SizedBox(
                                    width: 19,
                                  ),
                                  Text(
                                    "Shows",
                                    style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            ColoredTextFormField(
                              labelText: 'Email',
                              // hintText: 'imenko.prezimenovic@infinum.com',
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                              margin: const EdgeInsets.only(bottom: 20),
                            ),
                            ColoredTextFormField(
                              labelText: 'Password',
                              obscureText: true,
                              controller: _passwordController,
                              validator: registerPasswordValidator,
                              margin: const EdgeInsets.only(bottom: 20),
                            ),
                            ColoredTextFormField(
                              labelText: 'Repeat password',
                              obscureText: true,
                              controller: _confirmPasswordController,
                              validator: registerPasswordValidator,
                              margin: const EdgeInsets.only(bottom: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: horizontalMargin,
                    ),
                    child: LoadingButton(
                      title: 'Register',
                      buttonStateProvider: _registerButtonStateProvider,
                      margin: const EdgeInsets.only(bottom: 20),
                      onPressed: () {
                        final form = _formKey.currentState;
                        if (form?.validate() ?? false) {
                          context.read(_registerButtonStateProvider).state = ButtonState.loading;
                          context
                              .read(authProvider)
                              .register(_emailController.text, _passwordController.text, _confirmPasswordController.text)
                              .then((result) {
                            if (result == null) {
                              // arguments = true because it is coming from register screen
                              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName, arguments: true);
                            } else {
                              showSnackBarNotification(result);
                              context.read(_registerButtonStateProvider).state = ButtonState.disabled;
                            }
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? registerPasswordValidator(String? value) {
    if (_passwordController.text != _confirmPasswordController.text) {
      return 'Passwords must match';
    }

    return passwordValidator(value);
  }
}
