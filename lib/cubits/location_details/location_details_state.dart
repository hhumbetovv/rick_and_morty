part of 'location_details_cubit.dart';

class LocationDetailsState extends Equatable {
  final LocationModel? model;
  final bool isLoading;
  final List<CharacterModel> residents;
  final EntityFailure? failure;

  const LocationDetailsState({
    this.model,
    this.isLoading = false,
    this.failure,
    required this.residents,
  });

  @override
  List<Object?> get props => [model, isLoading, failure, residents];

  LocationDetailsState copyWith({
    LocationModel? model,
    bool isLoading = false,
    EntityFailure? failure,
    List<CharacterModel>? residents,
  }) {
    return LocationDetailsState(
      model: model,
      isLoading: isLoading,
      failure: failure,
      residents: residents ?? this.residents,
    );
  }
}
