import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardText extends StatelessWidget {
  const CardText(
    this.text, {
    Key? key,
    this.style,
  }) : super(key: key);

  final String? text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Text(
      switch (text) {
        null => l10n.unknown,
        '' => l10n.unknown,
        'unknown' => l10n.unknown,
        _ => text!,
      },
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
