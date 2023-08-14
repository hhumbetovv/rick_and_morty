import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/gifs.dart';
import '../../../constants/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late final ValueNotifier<bool> _showGif;
  late final AnimationController _animationController;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _showGif = ValueNotifier<bool>(true);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<Offset>(
      begin: const Offset(-1.5, 0.0),
      end: const Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward().whenComplete(() {
      _showGif.value = false;
      context.go(Routes.characters);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _showGif.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _showGif,
          builder: (context, showGif, child) {
            if (showGif) {
              return AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return SlideTransition(
                    position: _animation,
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Image.asset(AppGifs.runners.path),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
