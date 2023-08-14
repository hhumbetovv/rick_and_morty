import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/text_manager.dart';
import 'package:rick_and_morty/constants/text_styles.dart';
import 'package:rick_and_morty/data/models/response/episode_model.dart';
import 'package:rick_and_morty/presentation/global/components/info_list_tile.dart';

class EpInfo extends StatelessWidget {
  const EpInfo({
    Key? key,
    required this.model,
  }) : super(key: key);

  final EpisodeModel? model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(TextManager.informations, style: TextStyles.containerTitleStyle),
          const SizedBox(height: 16),
          InfoListTile(title: TextManager.episode, value: model?.episode ?? ''),
          InfoListTile(title: TextManager.date, value: model?.air_date ?? ''),
        ],
      ),
    );
  }
}
