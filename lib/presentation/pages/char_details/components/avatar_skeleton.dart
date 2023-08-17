import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/colors.dart';

class AvatarSkeleton extends StatelessWidget {
  const AvatarSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Shimmer.fromColors(
          baseColor: AppColors.shimmerBase,
          highlightColor: AppColors.shimmerHighlight,
          child: const CircleAvatar(
            radius: 75,
          ),
        ),
      ),
    );
  }
}
