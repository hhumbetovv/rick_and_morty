import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/themes.dart';
import '../cubits/cubit/settings_cubit.dart';
import 'routers/app_router.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state.failure != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure?.message ?? l10n?.error ?? ''),
            ),
          );
        }
      },
      builder: (context, state) {
        return MaterialApp.router(
          title: AppLocalizations.of(context)?.appTitle ?? "Rick and Morty",
          theme: AppThemes.light,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: state.locale,
          builder: (context, child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(textScaleFactor: data.textScaleFactor > 1.5 ? 1.5 : data.textScaleFactor),
              child: child ?? const SizedBox(),
            );
          },
        );
      },
    );
  }
}
