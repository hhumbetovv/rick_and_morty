import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/images.dart';
import '../../../cubits/locations/locations_cubit.dart';
import '../../global/components/load_more_button.dart';
import '../../global/components/name_search.dart';
import '../../global/components/page_image.dart';
import 'components/loc_card.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          slivers: [
            const SliverToBoxAdapter(
              child: PageImage(image: AppImages.locsPageImage),
            ),
            SliverToBoxAdapter(
              child: NameSearch(onSearch: (value) {
                context.read<LocationsCubit>().setFilter(name: value);
              }),
            ),
            BlocConsumer<LocationsCubit, LocationsState>(
              listener: (context, state) {
                if (state.failure != null && state.locations.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.failure!.message ?? "error".tr()),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.isLoading && state.locations.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state.failure != null && state.locations.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(state.failure!.message.toString()),
                    ),
                  );
                }
                return SliverList.separated(
                  itemCount: state.nextPage != -1 ? state.locations.length + 1 : state.locations.length,
                  itemBuilder: (context, index) {
                    if (state.nextPage != -1 && index == state.locations.length) {
                      return LoadMoreButton(
                        isLoading: state.isLoading,
                        onPressed: () {
                          context.read<LocationsCubit>().getLocations();
                        },
                      );
                    }
                    return LocCard(
                      id: state.locations[index].id,
                      name: state.locations[index].name,
                      type: state.locations[index].type,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
