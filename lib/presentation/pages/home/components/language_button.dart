import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/dialogs/language_bottom_sheet.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showLanguageBottomSheet(context);
      },
      child: Container(
        height: 24,
        width: 24,
        margin: const EdgeInsets.only(right: 24),
        alignment: Alignment.center,
        child: const Icon(
          Icons.language,
          color: Colors.black,
        ),
      ),
    );
  }
}
