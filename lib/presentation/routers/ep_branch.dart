import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants/routes.dart';
import '../../cubits/episodes/episodes_cubit.dart';
import '../../data/contractors/base_ep_repository.dart';
import '../../data/repositories/ep_repository.dart';
import '../pages/episodes/episodes_view.dart';
import 'sub_routes.dart';

class EpBranch extends StatefulShellBranch {
  EpBranch()
      : super(
          navigatorKey: GlobalKey<NavigatorState>(),
          routes: [
            GoRoute(
              path: Routes.episodes,
              builder: (context, state) {
                return RepositoryProvider<BaseEpRepository>(
                  create: (context) => EpRepository(),
                  child: BlocProvider(
                    create: (context) => EpisodesCubit(
                      context.read<BaseEpRepository>(),
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
