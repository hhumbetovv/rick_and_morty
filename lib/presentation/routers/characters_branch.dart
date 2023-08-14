import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants/routes.dart';
import '../../cubits/characters/characters_cubit.dart';
import '../../data/contractors/base_character_repository.dart';
import '../../data/repositories/character_repository.dart';
import '../pages/characters/characters_view.dart';
import 'sub_routes.dart';

class CharactersBranch extends StatefulShellBranch {
  CharactersBranch()
      : super(
          navigatorKey: GlobalKey<NavigatorState>(),
          routes: [
            GoRoute(
              path: Routes.characters,
              builder: (context, state) {
                return RepositoryProvider<BaseCharacterRepository>(
                  create: (context) => CharacterRepository(),
                  child: BlocProvider(
                    create: (context) => CharactersCubit(
                      context.read<BaseCharacterRepository>(),
                    )..getCharacters(),
                    child: const CharactersView(),
                  ),
                );
              },
            ),
            ...SubRoutes.routes,
          ],
        );
}
