import 'package:flutter/material.dart';

import 'app_inkwell.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    this.child,
    this.onTap,
  }) : super(key: key);

  final Widget? child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: const Offset(0, 1),
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
