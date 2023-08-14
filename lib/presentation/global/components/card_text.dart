import 'package:flutter/material.dart';

import '../../../constants/text_manager.dart';

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
    return Text(
      text ?? TextManager.unknown,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
