import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/routes.dart';
import '../../../../constants/text_styles.dart';
import '../../../global/components/app_card.dart';
import '../../../global/components/card_text.dart';

class LocCard extends StatelessWidget {
  const LocCard({
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
        context.push('${Routes.locDetails}/$id');
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
