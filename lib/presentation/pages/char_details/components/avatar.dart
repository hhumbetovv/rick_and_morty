import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Hero(
          tag: image ?? '',
          child: CircleAvatar(
            radius: 75,
            backgroundImage: image != null ? CachedNetworkImageProvider(image!) : null,
          ),
        ),
      ),
    );
  }
}
