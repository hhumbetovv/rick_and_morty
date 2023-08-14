import 'package:flutter/material.dart';

import '../constants/text_manager.dart';
import '../constants/themes.dart';
import 'routers/app_router.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: TextManager.appTitle,
      theme: AppThemes.light,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: data.textScaleFactor > 1.5 ? 1.5 : data.textScaleFactor),
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}
