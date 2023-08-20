import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 9, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.infoTitleStyle),
              Text(value.isEmpty ? l10n.unknown : value, style: TextStyles.infoValueStyle),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
