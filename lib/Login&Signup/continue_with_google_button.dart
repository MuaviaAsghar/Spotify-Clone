import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/Constants/constant_colors.dart';
import 'package:myapp/Constants/constant_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../BasicLogics/signin_with_google.dart';

class ContinueWithGoogleButton extends HookConsumerWidget {
  const ContinueWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          SigninWithGoogle();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kBlackColor,
          fixedSize: const Size(300, 45),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          side: const BorderSide(color: Colors.grey),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                kGoogleIcon,
                width: 20,
                height: 20,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text("Continue with Google",
                  style: TextStyle(color: kWhiteColor)),
            )
          ],
        ));
  }
}
