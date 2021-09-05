import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinum_academy_android_flutter/services/authentication_client.dart';
import 'package:infinum_academy_android_flutter/ui/common/no_glow_scroll_behavior.dart';
import 'package:infinum_academy_android_flutter/ui/common/validators/email_validator.dart';
import 'package:infinum_academy_android_flutter/ui/common/validators/password_validator.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/colored_text_form_field.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/loading_button.dart';
import 'package:infinum_academy_android_flutter/ui/login/widgets/stateful_checkbox_list_tile.dart';
import 'package:infinum_academy_android_flutter/ui/register/register_screen.dart';
import 'package:infinum_academy_android_flutter/ui/shows/shows_screen.dart';
import 'package:infinum_academy_android_flutter/extensions/build_context_extension.dart';

const horizontalMargin = 20.0;

final _loginButtonStateProvider = StateProvider((ref) => ButtonState.disabled);
final _registerButtonStateProvider = StateProvider((ref) => ButtonState.enabled);
final _checkboxProvider = StateProvider((ref) => false);

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key? key,
    this.isFromRegister = false,
  }) : super(key: key);

  static const routeName = '/login';

  final bool isFromRegister;

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void checkIfValidFormAndUpdateLoginButtonState() {
      if (emailValidator(_emailController.text) == null && passwordValidator(_passwordController.text) == null) {
        context.read(_loginButtonStateProvider).state = ButtonState.enabled;
      } else if (context.read(_loginButtonStateProvider).state == ButtonState.enabled) {
        context.read(_loginButtonStateProvider).state = ButtonState.disabled;
      }
    }

    Future<void> _login() async {
      final form = _formKey.currentState;
      final isValidForm = form?.validate() ?? false;

      if (isValidForm) {
        context.read(_loginButtonStateProvider).state = ButtonState.loading;
        final result = await context
            .read(authProvider)
            .login(_emailController.text, _passwordController.text, isRememberMeChecked: context.read(_checkboxProvider).state);

        if (result == null) {
          Navigator.of(context).pushReplacementNamed(ShowsScreen.routeName);
        } else {
          context.showSnackBar(result);
        }
        context.read(_loginButtonStateProvider).state = ButtonState.disabled;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: horizontalMargin,
                  ),
                  margin: EdgeInsets.only(bottom: isFromRegister ? 85 : 155),
                  alignment: Alignment.center,
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        onChanged: checkIfValidFormAndUpdateLoginButtonState,
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                isFromRegister ? 'Registration successful!' : 'Login',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'In order to continue please log in.',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ColoredTextFormField(
                              labelText: 'Email',
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ColoredTextFormField(
                              labelText: 'Password',
                              obscureText: true,
                              validator: passwordValidator,
                              controller: _passwordController,
                            ),
                            StatefulCheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: const Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onChanged: (checked) => context.read(_checkboxProvider).state = checked,
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LoadingButton(
                          title: 'Login',
                          buttonStateProvider: _loginButtonStateProvider,
                          margin: const EdgeInsets.only(bottom: 20.0),
                          onPressed: _login,
                        ),
                        Visibility(
                          visible: !isFromRegister,
                          child: LoadingButton(
                            title: 'Register',
                            buttonStateProvider: _registerButtonStateProvider,
                            margin: const EdgeInsets.only(bottom: 20.0),
                            enabledBackgroundColor: Theme.of(context).backgroundColor,
                            enabledTitleColor: Colors.white,
                            onPressed: () => Navigator.of(context).pushNamed(RegisterScreen.routeName),
                          ),
                        ),
                      ],
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
