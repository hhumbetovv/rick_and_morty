import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants/routes.dart';
import '../../cubits/character_details/character_details_cubit.dart';
import '../../cubits/episode_details/episode_details_cubit.dart';
import '../../cubits/location_details/location_details_cubit.dart';
import '../../data/contractors/base_character_repository.dart';
import '../../data/contractors/base_episode_repository.dart';
import '../../data/contractors/base_location_repository.dart';
import '../../data/repositories/character_repository.dart';
import '../../data/repositories/episode_repository.dart';
import '../../data/repositories/location_repository.dart';
import '../pages/character_details/character_details_view.dart';
import '../pages/episode_details/episode_details_view.dart';
import '../pages/location_details/locations_details_view.dart';

abstract class SubRoutes {
  static final List<GoRoute> _routes = [
    GoRoute(
      path: '${Routes.characterDetails}/:id',
      builder: (context, state) {
        return RepositoryProvider<BaseCharacterRepository>(
          create: (context) => CharacterRepository(),
          child: RepositoryProvider<BaseEpisodeRepository>(
            create: (context) => EpisodeRepository(),
            child: BlocProvider(
              create: (context) => CharacterDetailsCubit(
                context.read<BaseCharacterRepository>(),
                context.read<BaseEpisodeRepository>(),
              )..fetchCharacter(int.parse(state.pathParameters['id'] ?? '1')),
              child: const CharacterDetailsView(),
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: '${Routes.locationDetails}/:id',
      builder: (context, state) {
        return RepositoryProvider<BaseLocationRepository>(
          create: (context) => LocationRepository(),
          child: RepositoryProvider<BaseCharacterRepository>(
            create: (context) => CharacterRepository(),
            child: BlocProvider(
              create: (context) => LocationDetailsCubit(
                context.read<BaseLocationRepository>(),
                context.read<BaseCharacterRepository>(),
              )..fetchLocation(int.parse(state.pathParameters['id'] ?? '1')),
              child: const LocationDetailsView(),
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: '${Routes.episodeDetails}/:id',
      builder: (context, state) {
        return RepositoryProvider<BaseEpisodeRepository>(
          create: (context) => EpisodeRepository(),
          child: RepositoryProvider<BaseCharacterRepository>(
            create: (context) => CharacterRepository(),
            child: BlocProvider(
              create: (context) => EpisodeDetailsCubit(
                context.read<BaseEpisodeRepository>(),
                context.read<BaseCharacterRepository>(),
              )..fetchEpisode(int.parse(state.pathParameters['id'] ?? '1')),
              child: const EpisodeDetailsView(),
            ),
          ),
        );
      },
    ),
  ];
  static List<GoRoute> get routes => _routes;
}
