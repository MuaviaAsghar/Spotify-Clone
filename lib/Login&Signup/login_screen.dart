import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/Login&Signup/continue_with_google_button.dart';
import 'package:myapp/Constants/constant_assets.dart';
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                  0.05,
                  0.9,
                ],
                    colors: [
                  Color.fromARGB(75, 138, 131, 131),
                  Colors.black12,
                ])),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    // Center the logo
                    Center(
                      child: Image.asset(
                        kSpotifyWhiteIcon,
                        height: 75,
                        width: 75,
                      ),
                    ),
                    // Positioned button near the bottom center of the screen
                    const Positioned(
                      bottom:
                          50, // Adjust the distance from the bottom as needed
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ContinueWithGoogleButton(),
                      ),
                    ),
                  ],
                ))));
  }
}
