import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants/routes.dart';
import '../../cubits/episodes/episodes_cubit.dart';
import '../../data/contractors/base_episode_repository.dart';
import '../../data/repositories/episode_repository.dart';
import '../pages/episodes/episodes_view.dart';
import 'sub_routes.dart';

class EpisodesBranch extends StatefulShellBranch {
  EpisodesBranch()
      : super(
          navigatorKey: GlobalKey<NavigatorState>(),
          routes: [
            GoRoute(
              path: Routes.episodes,
              builder: (context, state) {
                return RepositoryProvider<BaseEpisodeRepository>(
                  create: (context) => EpisodeRepository(),
                  child: BlocProvider(
                    create: (context) => EpisodesCubit(
                      context.read<BaseEpisodeRepository>(),
                    )..getEpisodes(),
                    child: const EpisodesView(),
                  ),
                );
              },
            ),
            ...SubRoutes.routes,
          ],
        );
}
