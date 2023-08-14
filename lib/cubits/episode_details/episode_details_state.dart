part of 'episode_details_cubit.dart';

class EpisodeDetailsState extends Equatable {
  final EpisodeModel? model;
  final bool isLoading;
  final List<CharacterModel> cast;
  final EntityFailure? failure;

  const EpisodeDetailsState({
    this.model,
    this.isLoading = false,
    this.failure,
    required this.cast,
  });

  @override
  List<Object?> get props => [model, isLoading, failure, cast];

  EpisodeDetailsState copyWith({
    EpisodeModel? model,
    bool isLoading = false,
    EntityFailure? failure,
    List<CharacterModel>? cast,
  }) {
    return EpisodeDetailsState(
      model: model,
      isLoading: isLoading,
      failure: failure,
      cast: cast ?? this.cast,
    );
  }
}
