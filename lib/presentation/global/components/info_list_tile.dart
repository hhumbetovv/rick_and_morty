import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/text_styles.dart';

class InfoListTile extends StatelessWidget {
  const InfoListTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 9, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.infoTitleStyle),
              Text(value.isEmpty ? "unknown".tr() : value, style: TextStyles.infoValueStyle),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
