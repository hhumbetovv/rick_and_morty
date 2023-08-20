import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/text_styles.dart';

class EntityName extends StatelessWidget {
  const EntityName({
    Key? key,
    required this.name,
  })  : padding = EdgeInsets.zero,
        super(key: key);

  const EntityName.padding({
    Key? key,
    required this.name,
  })  : padding = const EdgeInsets.symmetric(vertical: 16),
        super(key: key);

  final String name;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: padding,
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            name.isEmpty ? l10n.unknown : name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.nameStyle,
          ),
        ),
      ),
    );
  }
}
