part of 'locations_cubit.dart';

class LocationsState extends Equatable {
  final List<LocationModel> locations;
  final int nextPage;
  final bool isLoading;
  final EntityFailure? failure;
  final LocationFilter filter;

  const LocationsState({
    required this.locations,
    required this.nextPage,
    this.failure,
    this.isLoading = false,
    required this.filter,
  });

  @override
  List<Object?> get props => [locations, isLoading, failure, nextPage, filter];

  LocationsState copyWith({
    List<LocationModel>? locations,
    int? nextPage,
    EntityFailure? failure,
    bool isLoading = false,
    LocationFilter? filter,
  }) {
    return LocationsState(
      locations: locations ?? this.locations,
      nextPage: nextPage ?? this.nextPage,
      isLoading: isLoading,
      failure: failure,
      filter: filter ?? this.filter,
    );
  }
}
