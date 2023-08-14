import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/constants/routes.dart';

import '../../../../constants/text_styles.dart';
import '../../../global/components/app_card.dart';
import '../../../global/components/card_text.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    Key? key,
    required this.id,
    required this.name,
    required this.type,
  }) : super(key: key);

  final int id;
  final String? name;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () {
        context.push('${Routes.locationDetails}/$id');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardText(name, style: TextStyles.cardNameStyle),
            CardText(type, style: TextStyles.cardDescriptionStyle),
          ],
        ),
      ),
    );
  }
}
