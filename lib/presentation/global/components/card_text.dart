import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
      text ?? "unknown".tr(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
