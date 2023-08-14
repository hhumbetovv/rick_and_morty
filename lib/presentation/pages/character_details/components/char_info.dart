import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/constants/routes.dart';
import 'package:rick_and_morty/constants/text_manager.dart';
import 'package:rick_and_morty/constants/text_styles.dart';
import 'package:rick_and_morty/data/models/response/character_location_model.dart';
import 'package:rick_and_morty/data/models/response/character_model.dart';
import 'package:rick_and_morty/presentation/global/components/app_inkwell.dart';
import 'package:rick_and_morty/presentation/global/components/info_list_tile.dart';
import 'package:rick_and_morty/utils/url_helper.dart';

class CharInfo extends StatelessWidget {
  const CharInfo({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CharacterModel? model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(TextManager.informations, style: TextStyles.containerTitleStyle),
          const SizedBox(height: 16),
          InfoListTile(title: TextManager.gender, value: model?.gender ?? ''),
          InfoListTile(title: TextManager.status, value: model?.status ?? ''),
          InfoListTile(title: TextManager.specie, value: model?.species ?? ''),
          InfoListTile(title: TextManager.type, value: model?.type ?? ''),
          _LocationListTile(title: TextManager.origin, location: model?.origin),
          _LocationListTile(title: TextManager.location, location: model?.location),
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
  final CharacterLocationModel? location;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: location?.url.isNotEmpty ?? false
          ? () {
              context.push('${Routes.locationDetails}/${UrlHelper.getId(location!.url)}');
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
                        (location?.name.isEmpty ?? true) ? TextManager.unknown : location!.name,
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
