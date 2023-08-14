import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class FractionallyTextSkeleton extends StatelessWidget {
  const FractionallyTextSkeleton({
    Key? key,
    required this.widthFactor,
    required this.fontSize,
    required this.height,
  }) : super(key: key);

  final double widthFactor;
  final double fontSize;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: Container(
          color: AppColors.shimmerBase,
          height: fontSize,
          margin: EdgeInsets.symmetric(vertical: (height - fontSize) / 2),
        ),
      ),
    );
  }
}
