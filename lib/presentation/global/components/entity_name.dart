import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/text_styles.dart';

class EntityName extends StatelessWidget {
  const EntityName({
    Key? key,
    required this.name,
  })  : padding = EdgeInsets.zero,
        super(key: key);

  const EntityName.padding({
    Key? key,
    required this.name,
  })  : padding = const EdgeInsets.symmetric(vertical: 16),
        super(key: key);

  final String name;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            name.isEmpty ? "unknown".tr() : name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.nameStyle,
          ),
        ),
      ),
    );
  }
}
