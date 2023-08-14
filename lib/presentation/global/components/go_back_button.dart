import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/constants/text_manager.dart';
import 'package:rick_and_morty/constants/text_styles.dart';
import 'package:rick_and_morty/presentation/global/components/app_inkwell.dart';

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
      child: const Row(
        children: [
          Icon(Icons.arrow_back),
          SizedBox(width: 8),
          Text(
            TextManager.goBackText,
            style: TextStyles.goBackButtonStyle,
          ),
        ],
      ),
    );
  }
}
