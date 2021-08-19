import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinum_academy_android_flutter/ui/common/no_glow_scroll_behavior.dart';
import 'package:infinum_academy_android_flutter/ui/common/validators/email_validator.dart';
import 'package:infinum_academy_android_flutter/ui/common/validators/password_validator.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/colored_text_form_field.dart';
import 'package:infinum_academy_android_flutter/ui/common/widgets/loading_button.dart';
import 'package:infinum_academy_android_flutter/ui/register_screen/register_screen.dart';

const horizontalMargin = 20.0;

final loginButtonStateProvider =
    StateProvider<ButtonState>((ref) => ButtonState.disabled);
final registerButtonStateProvider =
    StateProvider<ButtonState>((ref) => ButtonState.enabled);

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key? key,
    this.isFromRegister = false,
  }) : super(key: key);

  static const routeName = '/login';

  final bool isFromRegister;

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                child: SvgPicture.asset("assets/top_left_illustration.svg"),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset("assets/top_right_illustration.svg"),
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
                        onChanged: () {
                          if (emailValidator(emailController.text) == null &&
                              passwordValidator(passwordController.text) ==
                                  null) {
                            context.read(loginButtonStateProvider).state =
                                ButtonState.enabled;
                          }
                        },
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
                                  SvgPicture.asset("assets/ic_triangle.svg"),
                                  const SizedBox(
                                    width: 19,
                                  ),
                                  Text(
                                    "Shows",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                isFromRegister
                                    ? 'Registration successful!'
                                    : 'Login',
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
                              labelText: 'Mail',
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ColoredTextFormField(
                              labelText: 'Password',
                              validator: passwordValidator,
                              controller: passwordController,
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
                          buttonStateProvider: loginButtonStateProvider,
                          margin: const EdgeInsets.only(bottom: 20.0),
                          onPressed: () {
                            //TODO: login
                            final form = _formKey.currentState;
                            if (form?.validate() ?? false) {
                              context.read(loginButtonStateProvider).state =
                                  ButtonState.loading;
                            }
                          },
                        ),
                        Visibility(
                          visible: !isFromRegister,
                          child: LoadingButton(
                            title: 'Register',
                            buttonStateProvider: registerButtonStateProvider,
                            margin: const EdgeInsets.only(bottom: 20.0),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RegisterScreen.routeName);
                            },
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
