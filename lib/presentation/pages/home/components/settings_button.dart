import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/constants/routes.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showLanguageBottomSheet(context);
        context.push(Routes.settings);
      },
      child: Container(
        height: 24,
        width: 24,
        margin: const EdgeInsets.only(right: 24),
        alignment: Alignment.center,
        child: const Icon(
          Icons.settings,
          color: Colors.black,
        ),
      ),
    );
  }
}
