import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("informations", style: TextStyles.containerTitleStyle).tr(),
          const SizedBox(height: 16),
          InfoListTile(title: "gender", value: model?.gender ?? ''),
          InfoListTile(title: "status", value: model?.status ?? ''),
          InfoListTile(title: "specie", value: model?.species ?? ''),
          InfoListTile(title: "type", value: model?.type ?? ''),
          _LocationListTile(title: "origin", location: model?.origin),
          _LocationListTile(title: "location", location: model?.location),
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
                      Text(title.tr(), style: TextStyles.infoTitleStyle),
                      Text(
                        (location?.name.isEmpty ?? true) ? "unknown".tr() : location!.name,
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
