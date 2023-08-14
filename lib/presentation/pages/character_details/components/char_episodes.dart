import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/constants/routes.dart';
import 'package:rick_and_morty/constants/text_manager.dart';
import 'package:rick_and_morty/constants/text_styles.dart';
import 'package:rick_and_morty/data/models/response/episode_model.dart';
import 'package:rick_and_morty/presentation/global/components/app_inkwell.dart';

class CharEpisodes extends StatelessWidget {
  const CharEpisodes({
    Key? key,
    required this.episodes,
  }) : super(key: key);

  final List<EpisodeModel> episodes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(TextManager.episodes, style: TextStyles.containerTitleStyle),
          const SizedBox(height: 16),
          ...episodes.map((model) => _EpisodeListTile(model: model)).toList(),
        ],
      ),
    );
  }
}

class _EpisodeListTile extends StatelessWidget {
  const _EpisodeListTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  final EpisodeModel model;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () {
        context.push('${Routes.episodeDetails}/${model.id}');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.episode, style: TextStyles.infoTitleStyle),
                      Text(model.name, style: TextStyles.infoValueStyle),
                      Text(model.air_date, style: TextStyles.infoDateStyle),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.blueGrey),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
