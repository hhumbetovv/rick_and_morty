import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/contractors/base_loc_repository.dart';
import '../../data/failures.dart';
import '../../data/models/filters/loc_filter.dart';
import '../../data/models/response/loc_model.dart';
import '../../data/models/response/result_model.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit(
    this._locRepository,
  ) : super(const LocationsState(locations: [], nextPage: 1, filter: LocationFilter()));

  final BaseLocRepository _locRepository;

  void getLocations() async {
    emit(state.copyWith(isLoading: true));
    final response = await _locRepository.getLocations(
      page: state.nextPage,
      name: state.filter.name,
    );
    if (response.isSuccess()) {
      final ResultModel result = response.tryGetSuccess()!;
      final List<LocModel> locations = result.results.map((entityJson) {
        return LocModel.fromJson(entityJson);
      }).toList();
      final int nextPage = result.info.next == null ? -1 : state.nextPage + 1;
      emit(
        state.copyWith(
          locations: [...state.locations, ...locations],
          nextPage: nextPage,
        ),
      );
    } else {
      emit(
        state.copyWith(
          failure: EntityFailure(
              // "fetchingFailureWithFilter".tr(args: ["locations".tr().toLowerCase()]),
              ),
        ),
      );
    }
  }

  void setFilter({String? name}) {
    debugPrint(name);
    final LocationFilter filter = LocationFilter(
      name: name ?? state.filter.name,
    );
    debugPrint((filter != state.filter).toString());
    if (filter != state.filter) {
      emit(state.copyWith(locations: [], nextPage: 1, filter: filter));
      getLocations();
    }
  }
}
