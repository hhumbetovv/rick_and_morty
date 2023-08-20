import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../constants/text_styles.dart';

class Selections extends StatelessWidget {
  const Selections({
    Key? key,
    required this.indexCallback,
  }) : super(key: key);

  final Function(int index) indexCallback;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return IntrinsicWidth(
      stepWidth: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _SelectionButton(
            text: l10n.characters,
            onTap: () => indexCallback(0),
          ),
          _SelectionButton(
            text: l10n.locations,
            onTap: () => indexCallback(1),
          ),
          _SelectionButton(
            text: l10n.episodes,
            onTap: () => indexCallback(2),
          ),
        ],
      ),
    );
  }
}

class _SelectionButton extends StatelessWidget {
  const _SelectionButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: CupertinoButton(
        onPressed: onTap,
        child: Text(text, style: TextStyles.selectionStyle),
      ),
    );
  }
}
