import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container();
          },
        );
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
