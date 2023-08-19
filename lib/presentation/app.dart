import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/themes.dart';
import 'routers/app_router.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "appTitle".trExists() ? "appTitle".tr() : "Rick and Morty",
      theme: AppThemes.light,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
