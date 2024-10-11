import 'package:flutter/material.dart';
import 'package:flutter_hover_effect/flutter_hover_effect.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/Constants/constant_assets.dart';

import '../Constants/constant_colors.dart';

class HomeScreenAppbar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const HomeScreenAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.02,
      ),
      child: AppBar(
        title: Text(
          DateTime.now().hour < 12
              ? "Good morning"
              : DateTime.now().hour < 17
                  ? "Good afternoon"
                  : "Good evening",
          style: const TextStyle(
              color: kWhiteColor, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  kBellIcon,
                  theme: const SvgTheme(
                    currentColor: kWhiteColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  kListeningHistory,
                  theme: const SvgTheme(
                    currentColor: kWhiteColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  kSettingGear,
                  theme: const SvgTheme(
                    currentColor: kWhiteColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
