import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/contractors/base_location_repository.dart';
import '../../data/failures.dart';
import '../../data/models/filters/location_filter.dart';
import '../../data/models/response/location_model.dart';
import '../../data/models/response/result_model.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit(this.locationRepository)
      : super(const LocationsState(locations: [], nextPage: 1, filter: LocationFilter()));

  final BaseLocationRepository locationRepository;

  void getLocations() async {
    emit(state.copyWith(isLoading: true));
    final response = await locationRepository.getLocations(
      page: state.nextPage,
      name: state.filter.name,
    );
    if (response.isSuccess()) {
      final ResultModel result = response.tryGetSuccess()!;
      final List<LocationModel> locations = result.results.map((entityJson) {
        return LocationModel.fromJson(entityJson);
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
            'Some Error occured while fetching locations\n'
            'Please check your internet connection or use different filter options',
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
