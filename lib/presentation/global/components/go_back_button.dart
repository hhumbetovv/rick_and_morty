import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/text_styles.dart';
import 'app_inkwell.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () {
        context.pop();
      },
      child: Row(
        children: [
          const Icon(Icons.arrow_back),
          const SizedBox(width: 8),
          Text(
            "goBack".tr(),
            style: TextStyles.goBackButtonStyle,
          ),
        ],
      ),
    );
  }
}
