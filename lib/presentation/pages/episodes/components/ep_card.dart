// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/constants/routes.dart';
import 'package:rick_and_morty/constants/text_styles.dart';
import 'package:rick_and_morty/presentation/global/components/app_card.dart';
import 'package:rick_and_morty/presentation/global/components/card_text.dart';

class EpCard extends StatelessWidget {
  const EpCard({
    Key? key,
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
  }) : super(key: key);

  final int id;
  final String? name;
  final String? air_date;
  final String? episode;

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
            CardText(air_date, style: TextStyles.cardDescriptionStyle),
            CardText(episode, style: TextStyles.cardEpisodeStyle),
          ],
        ),
      ),
    );
  }
}
