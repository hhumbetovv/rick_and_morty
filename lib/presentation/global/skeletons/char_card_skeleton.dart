import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/colors.dart';
import 'package:rick_and_morty/presentation/global/components/app_card.dart';
import 'package:rick_and_morty/presentation/global/skeletons/fractionally_text_skeleton.dart';
import 'package:shimmer/shimmer.dart';

class CharCardSkeleton extends StatelessWidget {
  const CharCardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Shimmer.fromColors(
              baseColor: AppColors.shimmerBase,
              highlightColor: AppColors.shimmerHighlight,
              child: Container(
                color: AppColors.shimmerBase,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FractionallyTextSkeleton(widthFactor: 0.4, fontSize: 20, height: 30),
                FractionallyTextSkeleton(widthFactor: 0.3, fontSize: 14, height: 21),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
