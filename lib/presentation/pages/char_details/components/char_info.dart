import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/routes.dart';
import '../../../../constants/text_styles.dart';
import '../../../../data/models/response/char_location_model.dart';
import '../../../../data/models/response/char_model.dart';
import '../../../../utils/url_helper.dart';
import '../../../global/components/app_inkwell.dart';
import '../../../global/components/info_list_tile.dart';

class CharInfo extends StatelessWidget {
  const CharInfo({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CharModel? model;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.informations, style: TextStyles.containerTitleStyle),
          const SizedBox(height: 16),
          InfoListTile(
            title: l10n.gender,
            value: switch (model?.gender) {
              "Female" => l10n.female,
              "Male" => l10n.male,
              "Genderless" => l10n.genderless,
              _ => l10n.unknown,
            },
          ),
          InfoListTile(
            title: l10n.status,
            value: switch (model?.status) {
              'Alive' => l10n.alive,
              'Dead' => l10n.dead,
              _ => l10n.unknown,
            },
          ),
          InfoListTile(title: l10n.specie, value: model?.species ?? l10n.unknown),
          InfoListTile(title: l10n.type, value: model?.type ?? l10n.unknown),
          _LocationListTile(title: l10n.origin, location: model?.origin),
          _LocationListTile(title: l10n.location, location: model?.location),
        ],
      ),
    );
  }
}

class _LocationListTile extends StatelessWidget {
  const _LocationListTile({
    Key? key,
    required this.title,
    required this.location,
  }) : super(key: key);

  final String title;
  final CharLocationModel? location;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppInkWell(
      onTap: location?.url.isNotEmpty ?? false
          ? () {
              context.push('${Routes.locDetails}/${UrlHelper.getId(location!.url)}');
            }
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 9, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyles.infoTitleStyle),
                      Text(
                        (location?.name.isEmpty ?? true) ? l10n.unknown : location!.name,
                        style: TextStyles.infoValueStyle,
                      ),
                    ],
                  ),
                ),
                if ((location?.url.isNotEmpty ?? false)) const Icon(Icons.chevron_right, color: Colors.blueGrey)
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
