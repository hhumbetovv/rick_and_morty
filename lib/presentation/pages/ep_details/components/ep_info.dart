import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/text_styles.dart';
import '../../../../data/models/response/ep_model.dart';
import '../../../global/components/info_list_tile.dart';

class EpInfo extends StatelessWidget {
  const EpInfo({
    Key? key,
    required this.model,
  }) : super(key: key);

  final EpModel? model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("informations", style: TextStyles.containerTitleStyle).tr(),
          const SizedBox(height: 16),
          InfoListTile(title: "episode", value: model?.episode ?? ''),
          InfoListTile(title: "date", value: model?.air_date ?? ''),
        ],
      ),
    );
  }
}
