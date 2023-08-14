part of 'character_details_cubit.dart';

class CharacterDetailsState extends Equatable {
  final CharacterModel? model;
  final bool isLoading;
  final List<EpisodeModel> episodes;
  final EntityFailure? failure;

  const CharacterDetailsState({
    this.model,
    this.isLoading = false,
    this.failure,
    required this.episodes,
  });

  @override
  List<Object?> get props => [model, isLoading, failure, episodes];

  CharacterDetailsState copyWith({
    CharacterModel? model,
    bool isLoading = false,
    EntityFailure? failure,
    List<EpisodeModel>? episodes,
  }) {
    return CharacterDetailsState(
      model: model,
      isLoading: isLoading,
      failure: failure,
      episodes: episodes ?? this.episodes,
    );
  }
}
