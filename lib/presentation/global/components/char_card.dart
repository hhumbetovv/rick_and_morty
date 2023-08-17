import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/routes.dart';
import '../../../constants/text_styles.dart';
import 'app_card.dart';
import 'card_text.dart';

class CharCard extends StatelessWidget {
  const CharCard({
    Key? key,
    required this.id,
    required this.name,
    required this.species,
    required this.image,
  }) : super(key: key);

  final int id;
  final String? name;
  final String? species;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () {
        context.push('${Routes.charDetails}/$id');
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardImage(image: image),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardText(name, style: TextStyles.cardNameStyle),
                CardText(species, style: TextStyles.cardDescriptionStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Hero(
        tag: image,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          placeholder: (context, url) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          errorWidget: (context, url, error) {
            return const Center(
              child: Icon(Icons.error_outline_outlined),
            );
          },
        ),
      ),
    );
  }
}
