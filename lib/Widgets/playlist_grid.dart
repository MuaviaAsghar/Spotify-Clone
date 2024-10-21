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
          horizontal: screenSize.screenWidth * 0.04,
          vertical: screenSize.screenHeight * 0.03),
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
          Container(
            color: Colors.blue,
            // Ensure the ListView has a defined height
            height: screenSize.screenWidth * 0.76,
            width: screenSize.screenWidth * 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true, // Constrain the height of ListView
              itemCount: 10,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: screenSize.screenWidth * 0.025,
                      top: screenSize.screenHeight * 0.02),
                  child: Container(
                  
                    child: Column(
                      children: [
                        // Adjusted image size to use percentage-based values
                        Image.network(
                          'https://picsum.photos/seed/300/600',
                          height:
                              screenSize.screenWidth * 0.40, // Adjust height
                          width: screenSize.screenWidth * 0.35, // Adjust width
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            width: screenSize.screenWidth * 1,
                            child: const Text(
                              "Name, Name, Name, Name and more",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
