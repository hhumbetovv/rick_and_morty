import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({
    Key? key,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  final Function(bool) onChange;
  final bool value;

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    if (widget.value) {
      _controller.value = 1.0;
    } else {
      _controller.value = 0.0;
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(MenuButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  void toggleAnimate() {
    if (!_controller.isAnimating) {
      setState(() {
        widget.onChange(!_controller.isCompleted);
        if (_controller.isCompleted || _controller.isDismissed) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleAnimate,
      child: Container(
        height: 24,
        width: 24,
        margin: const EdgeInsets.only(right: 24),
        alignment: Alignment.center,
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _controller,
          color: Colors.black,
        ),
      ),
    );
  }
}
