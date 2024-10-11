import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'home_screen_appbar.dart';
import 'play_list_card.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const HomeScreenAppbar(),
      body: SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true, // Add this to constrain the height
          physics:
              const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext ctx, index) {
            return const PlayListCard();
          },
        ),
      ),
    );
  }
}
