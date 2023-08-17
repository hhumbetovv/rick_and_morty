import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants/routes.dart';
import '../../cubits/locations/locations_cubit.dart';
import '../../data/contractors/base_loc_repository.dart';
import '../../data/repositories/loc_repository.dart';
import '../pages/locations/locations_view.dart';
import 'sub_routes.dart';

class LocBranch extends StatefulShellBranch {
  LocBranch()
      : super(
          navigatorKey: GlobalKey<NavigatorState>(),
          routes: [
            GoRoute(
              path: Routes.locations,
              builder: (context, state) {
                return RepositoryProvider<BaseLocRepository>(
                  create: (context) => LocRepository(),
                  child: BlocProvider(
                    create: (context) => LocationsCubit(
                      context.read<BaseLocRepository>(),
                    )..getLocations(),
                    child: const LocationsView(),
                  ),
                );
              },
            ),
            ...SubRoutes.routes,
          ],
        );
}
