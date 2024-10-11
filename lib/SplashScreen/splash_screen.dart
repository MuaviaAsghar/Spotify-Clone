import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Constants/constant_assets.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              kSpotifyWhiteIcon,
              height: 105,
              width: 105,
            ),
          ),
        ],
      ),
    );
  }
}