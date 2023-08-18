import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("informations", style: TextStyles.containerTitleStyle).tr(),
          const SizedBox(height: 16),
          InfoListTile(title: "type", value: model?.type ?? ''),
          InfoListTile(title: "dimension", value: model?.dimension ?? ''),
        ],
      ),
    );
  }
}
