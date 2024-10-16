import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Make sure the package name is correct
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
    return Column(
      children: [
        Column(
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
            Center(
              child: SizedBox(
                height: 200, // Set the height as per your design
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true, // Constrain the height of ListView
                  itemCount: 10,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      height: 200,
                      width: 200,
                      color: Colors.white,
                      child: Image.network(
                        'https://picsum.photos/seed/300/600',
                        fit: BoxFit.cover,
                        height: screenSize.screenHeight*00.2,
                        width: screenSize.screenWidth,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
