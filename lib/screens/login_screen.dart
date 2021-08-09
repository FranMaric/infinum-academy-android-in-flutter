import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff3D1D72),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/top_left_illustration.png"),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("assets/top_right_illustration.png"),
            ),
            Positioned(
              bottom: 10,
              child: Container(
                // width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Color(0xffbbbbbb),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "sans-serif",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
