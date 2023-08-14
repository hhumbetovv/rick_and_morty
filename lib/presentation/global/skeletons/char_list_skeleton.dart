import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/global/skeletons/char_card_skeleton.dart';
import 'package:rick_and_morty/presentation/global/skeletons/fractionally_text_skeleton.dart';

class CharListSkeleton extends StatelessWidget {
  const CharListSkeleton({
    Key? key,
    this.count = 3,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FractionallyTextSkeleton(widthFactor: 0.4, fontSize: 20, height: 24),
          const SizedBox(height: 16),
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: count,
            itemBuilder: (context, index) {
              return const CharCardSkeleton();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 24);
            },
          )
        ],
      ),
    );
  }
}
