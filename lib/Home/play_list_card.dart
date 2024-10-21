import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Make sure the package name is correct
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Constants/constant_colors.dart';

class PlayListCard extends ConsumerWidget {
  // Constructor with required assetName parameter
  const PlayListCard({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      color: const Color.fromARGB(255, 41, 41, 41),
      child: Stack(
        // alignment: const AlignmentDirectional(0, -1),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              child: Image.network(
                'https://picsum.photos/seed/300/600',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.05),
              child: const Text(
                'Hello World',
                style: TextStyle(color: kWhiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
