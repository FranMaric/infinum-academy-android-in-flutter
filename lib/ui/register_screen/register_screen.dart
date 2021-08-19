import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinum_academy_android_flutter/ui/common/validators/email_validator.dart';
import 'package:infinum_academy_android_flutter/ui/common/validators/password_validator.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/colored_text_form_field.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/loading_button.dart';

const horizontalMargin = 20.0;

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static const routeName = '/register';

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                child: SvgPicture.asset("assets/top_left_illustration.svg"),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset("assets/top_right_illustration.svg"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: horizontalMargin),
                child: SizedBox.expand(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ColoredTextFormField(
                              labelText: 'Mail',
                              hintText: 'imenko.prezimenovic@infinum.com',
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                            ),
                            ColoredTextFormField(
                              labelText: 'Password',
                              controller: passwordController,
                              validator: (password) {
                                if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  return 'Passwords must match';
                                }
                                return passwordValidator(password);
                              },
                            ),
                            ColoredTextFormField(
                              labelText: 'Confirm password',
                              controller: confirmPasswordController,
                              validator: (confirmPassword) {
                                if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  return 'Passwords must match';
                                }
                                return passwordValidator(confirmPassword);
                              },
                            ),
                            LoadingButton(
                              onPressed: () {
                                final form = _formKey.currentState;
                                if (form?.validate() ?? false) {
                                  debugPrint('VALID REGISTER');
                                }
                              },
                              title: 'Register',
                            ),
                          ],
                        ),
                      ),
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
}
