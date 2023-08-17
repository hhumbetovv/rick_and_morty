import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants/routes.dart';
import '../../cubits/char_details/char_details_cubit.dart';
import '../../cubits/ep_details/ep_details_cubit.dart';
import '../../cubits/loc_details/loc_details_cubit.dart';
import '../../data/contractors/base_char_repository.dart';
import '../../data/contractors/base_ep_repository.dart';
import '../../data/contractors/base_loc_repository.dart';
import '../../data/repositories/char_repository.dart';
import '../../data/repositories/ep_repository.dart';
import '../../data/repositories/loc_repository.dart';
import '../pages/char_details/char_details_view.dart';
import '../pages/ep_details/episode_details_view.dart';
import '../pages/loc_details/loc_details_view.dart';

abstract class SubRoutes {
  static final List<GoRoute> _routes = [
    GoRoute(
      path: '${Routes.charDetails}/:id',
      builder: (context, state) {
        return RepositoryProvider<BaseCharRepository>(
          create: (context) => CharRepository(),
          child: RepositoryProvider<BaseEpRepository>(
            create: (context) => EpRepository(),
            child: BlocProvider(
              create: (context) => CharDetailsCubit(
                context.read<BaseCharRepository>(),
                context.read<BaseEpRepository>(),
              )..fetchCharacter(int.parse(state.pathParameters['id'] ?? '1')),
              child: const CharDetailsView(),
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: '${Routes.locDetails}/:id',
      builder: (context, state) {
        return RepositoryProvider<BaseLocRepository>(
          create: (context) => LocRepository(),
          child: RepositoryProvider<BaseCharRepository>(
            create: (context) => CharRepository(),
            child: BlocProvider(
              create: (context) => LocDetailsCubit(
                context.read<BaseLocRepository>(),
                context.read<BaseCharRepository>(),
              )..fetchLocation(int.parse(state.pathParameters['id'] ?? '1')),
              child: const LocDetailsView(),
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: '${Routes.epDetails}/:id',
      builder: (context, state) {
        return RepositoryProvider<BaseEpRepository>(
          create: (context) => EpRepository(),
          child: RepositoryProvider<BaseCharRepository>(
            create: (context) => CharRepository(),
            child: BlocProvider(
              create: (context) => EpDetailsCubit(
                context.read<BaseEpRepository>(),
                context.read<BaseCharRepository>(),
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
