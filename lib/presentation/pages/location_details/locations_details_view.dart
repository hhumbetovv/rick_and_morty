import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/constants/text_manager.dart';
import 'package:rick_and_morty/cubits/location_details/location_details_cubit.dart';
import 'package:rick_and_morty/presentation/global/components/char_list.dart';
import 'package:rick_and_morty/presentation/global/components/entity_name.dart';
import 'package:rick_and_morty/presentation/global/components/go_back_button.dart';
import 'package:rick_and_morty/presentation/global/skeletons/char_list_skeleton.dart';
import 'package:rick_and_morty/presentation/global/skeletons/entity_name_skeleton.dart';
import 'package:rick_and_morty/presentation/global/skeletons/info_skeleton.dart';
import 'package:rick_and_morty/presentation/pages/location_details/components/loc_info.dart';

class LocationDetailsView extends StatelessWidget {
  const LocationDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        child: BlocConsumer<LocationDetailsCubit, LocationDetailsState>(
          listener: (context, state) {
            if (state.failure != null) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.failure?.message ?? TextManager.error),
                ),
              );
            }
          },
          builder: (context, state) {
            return AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              firstChild: const Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GoBackButton(),
                    EntityNameSkeleton.padding(),
                    InfoSkeleton(count: 2),
                    CharListSkeleton(),
                  ],
                ),
              ),
              secondChild: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GoBackButton(),
                    EntityName.padding(name: state.model?.name ?? ''),
                    LocInfo(model: state.model),
                    CharList(title: TextManager.residents, list: state.residents),
                  ],
                ),
              ),
              crossFadeState: state.isLoading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            );
          },
        ),
      ),
    );
  }
}
