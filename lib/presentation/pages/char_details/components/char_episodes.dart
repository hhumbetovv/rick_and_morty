import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/routes.dart';
import '../../../../constants/text_styles.dart';
import '../../../../data/models/response/ep_model.dart';
import '../../../global/components/app_inkwell.dart';

class CharEpisodes extends StatelessWidget {
  const CharEpisodes({
    Key? key,
    required this.episodes,
  }) : super(key: key);

  final List<EpModel> episodes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("episodes", style: TextStyles.containerTitleStyle).tr(),
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

  final EpModel model;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () {
        context.push('${Routes.epDetails}/${model.id}');
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
