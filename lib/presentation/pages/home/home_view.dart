import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/images.dart';
import 'components/menu_button.dart';
import 'components/selections.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<bool> _openMenu = ValueNotifier(false);

  @override
  void dispose() {
    _scaffoldKey.currentState?.dispose();
    _openMenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Image.asset(AppImages.logo.path),
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: _openMenu,
            builder: (context, open, child) {
              return MenuButton(
                value: open,
                onChange: (open) {
                  if (open) {
                    _scaffoldKey.currentState?.openEndDrawer();
                  } else {
                    _scaffoldKey.currentState?.closeEndDrawer();
                  }
                  _openMenu.value = open;
                },
              );
            },
          )
        ],
      ),
      body: Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          width: double.maxFinite,
          child: Selections(
            indexCallback: (int index) {
              widget.navigationShell.goBranch(index);
              _scaffoldKey.currentState?.closeEndDrawer();
              _openMenu.value = false;
            },
          ),
        ),
        body: widget.navigationShell,
      ),
    );
  }
}
