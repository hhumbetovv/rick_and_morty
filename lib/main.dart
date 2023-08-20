import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/init.dart';
import 'cubits/cubit/settings_cubit.dart';
import 'data/contractors/base_localization_repository.dart';
import 'data/repositories/localization_repository.dart';
import 'presentation/app.dart';

void main() async {
  await init();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BaseLocalizationRepository>(create: (context) => LocalizationRepository()),
      ],
      child: BlocProvider<SettingsCubit>(
        create: (context) => SettingsCubit(
          context.read<BaseLocalizationRepository>(),
        )..initSettings(),
        child: const App(),
      ),
    ),
  );
}
