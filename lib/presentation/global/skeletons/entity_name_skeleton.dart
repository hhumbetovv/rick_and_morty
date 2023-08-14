import 'package:flutter/material.dart';

import 'fractionally_text_skeleton.dart';

class EntityNameSkeleton extends StatelessWidget {
  const EntityNameSkeleton({
    Key? key,
  })  : padding = EdgeInsets.zero,
        super(key: key);

  const EntityNameSkeleton.padding({
    Key? key,
  })  : padding = const EdgeInsets.symmetric(vertical: 16),
        super(key: key);

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: const Center(
        child: FractionallyTextSkeleton(
          widthFactor: 0.75,
          fontSize: 32,
          height: 50,
        ),
      ),
    );
  }
}
