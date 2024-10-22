import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Constants/constant_colors.dart';
import '../Constants/constant_screen_size.dart';

class PlaylistGrid extends ConsumerWidget {
  const PlaylistGrid({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final screenSize = ConstantScreenSize(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.screenWidth * 0.03,
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "PLAYLIST NAME",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kWhiteColor),
            ),
          ),
          SizedBox(
            // Ensure the ListView has a defined height
            height: screenSize.screenWidth * 0.60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                    padding: EdgeInsets.only(
                        right: screenSize.screenWidth *
                            0.05, // Padding to the right
                        top: screenSize.screenHeight * 0.02),
                    child: Column(
                      // Align picture and text vertically centered
                      children: [
                        // Adjusted image size to use percentage-based values
                        SizedBox(
                          height:
                              screenSize.screenWidth * 0.35, // Adjust height
                          width: screenSize.screenWidth * 0.35,
                          child: Image.network(
                            'https://picsum.photos/seed/300/600',
                            height:
                                screenSize.screenWidth * 0.35, // Adjust height
                            width:
                                screenSize.screenWidth * 0.35, // Adjust width
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                            height: 8), // Add spacing between image and text
                        SizedBox(
                          width: screenSize.screenWidth * 0.35,
                          // Align text to the left inside the container
                          child: const Text(
                            "Name, Name, Name, Name and more",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign:
                                TextAlign.start, // Align text to the left
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
