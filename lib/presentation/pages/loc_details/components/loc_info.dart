import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../constants/text_styles.dart';
import '../../../../data/models/response/loc_model.dart';
import '../../../global/components/info_list_tile.dart';

class LocInfo extends StatelessWidget {
  const LocInfo({
    Key? key,
    required this.model,
  }) : super(key: key);

  final LocModel? model;

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
          InfoListTile(title: l10n.type, value: model?.type ?? l10n.unknown),
          InfoListTile(title: l10n.dimension, value: model?.dimension ?? l10n.unknown),
        ],
      ),
    );
  }
}
