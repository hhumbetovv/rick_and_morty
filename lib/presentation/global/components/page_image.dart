import 'package:flutter/material.dart';

import '../../../constants/images.dart';

class PageImage extends StatelessWidget {
  const PageImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final AppImages image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Image.asset(
        image.path,
      ),
    );
  }
}
