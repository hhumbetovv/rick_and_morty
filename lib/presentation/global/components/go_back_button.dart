import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/text_styles.dart';
import 'app_inkwell.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppInkWell(
      onTap: () {
        context.pop();
      },
      child: Row(
        children: [
          const Icon(Icons.arrow_back),
          const SizedBox(width: 8),
          Text(
            l10n.goBack,
            style: TextStyles.goBackButtonStyle,
          ),
        ],
      ),
    );
  }
}
