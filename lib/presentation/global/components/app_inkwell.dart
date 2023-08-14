import 'package:flutter/material.dart';

enum InkType {
  ripple(value: InkRipple.splashFactory),
  sparkle(value: InkSparkle.splashFactory),
  splash(value: InkSplash.splashFactory),
  noSplash(value: null);

  const InkType({required this.value});
  final InteractiveInkFeatureFactory? value;
}

class AppInkWell extends StatelessWidget {
  const AppInkWell({
    Key? key,
    required this.child,
    this.type = InkType.sparkle,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final Widget child;
  final InkType type;
  final Function()? onTap;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return onTap == null
        ? child
        : Stack(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: [
              child,
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: type.value == null ? Colors.transparent : Colors.white.withOpacity(0.4),
                    splashColor: type.value == null ? Colors.transparent : Colors.white.withOpacity(0.4),
                    splashFactory: type.value,
                    onTap: onTap,
                    onLongPress: onLongPress,
                  ),
                ),
              )
            ],
          );
  }
}
