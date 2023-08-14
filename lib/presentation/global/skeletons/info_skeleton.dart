import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/global/skeletons/fractionally_text_skeleton.dart';
import 'package:rick_and_morty/presentation/global/skeletons/info_list_tile_skeleton.dart';

class InfoSkeleton extends StatelessWidget {
  const InfoSkeleton({
    Key? key,
    this.count = 3,
    this.isTriple = false,
  }) : super(key: key);

  final int count;
  final bool isTriple;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FractionallyTextSkeleton(widthFactor: 0.4, fontSize: 20, height: 24),
          const SizedBox(height: 16),
          ...List.generate(count, (index) => InfoListTileSkeleton(isTriple: isTriple)).toList(),
        ],
      ),
    );
  }
}
