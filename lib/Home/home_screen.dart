import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Constants/constant_screen_size.dart';
import '../Widgets/playlist_grid.dart';
import 'home_screen_appbar.dart';
import 'play_list_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final screenSize = ConstantScreenSize(context); // This is now safe

    // Optionally, you can print the values here
    print(screenSize.screenHeight.toString());
    print(screenSize.screenWidth.toString());

    return SafeArea(
      child: Scaffold(
        appBar: const HomeScreenAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenSize.screenWidth * 0.03),
                child: SizedBox(
                  height: screenSize.screenHeight *
                      0.15, // Adjust the height as per your design
                  child: GridView.builder(
                    shrinkWrap: true, // Constrain the height of GridView
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: screenSize.screenHeight /
                          300, // Adjust child aspect ratio based on screen height
                      crossAxisSpacing: screenSize.screenWidth / 500,
                      mainAxisSpacing: screenSize.screenWidth / 500,
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext ctx, index) {
                      return const PlayListCard();
                    },
                  ),
                ),
              ),
              const PlaylistGrid(), // Assuming this widget is another list/grid below
            ],
          ),
        ),
      ),
    );
  }
}
