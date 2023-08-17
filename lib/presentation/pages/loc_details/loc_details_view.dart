import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../cubits/loc_details/loc_details_cubit.dart';
import '../../global/components/char_list.dart';
import '../../global/components/entity_name.dart';
import '../../global/components/go_back_button.dart';
import '../../global/skeletons/char_list_skeleton.dart';
import '../../global/skeletons/entity_name_skeleton.dart';
import '../../global/skeletons/info_skeleton.dart';
import 'components/loc_info.dart';

class LocDetailsView extends StatelessWidget {
  const LocDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        child: BlocConsumer<LocDetailsCubit, LocDetailsState>(
          listener: (context, state) {
            if (state.failure != null) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.failure?.message ?? "error".tr()),
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
                    CharList(title: "residents".tr(), list: state.residents),
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
