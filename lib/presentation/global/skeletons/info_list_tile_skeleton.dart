import 'package:flutter/material.dart';

import 'fractionally_text_skeleton.dart';

class InfoListTileSkeleton extends StatelessWidget {
  const InfoListTileSkeleton({
    Key? key,
    this.isTriple = false,
  }) : super(key: key);

  final bool isTriple;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 9, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FractionallyTextSkeleton(widthFactor: 0.3, fontSize: 16, height: 24),
              const FractionallyTextSkeleton(widthFactor: 0.2, fontSize: 14, height: 20),
              if (isTriple) const FractionallyTextSkeleton(widthFactor: 0.4, fontSize: 10, height: 16),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
