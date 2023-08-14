part of 'episodes_cubit.dart';

class EpisodesState extends Equatable {
  final List<EpisodeModel> episodes;
  final int nextPage;
  final bool isLoading;
  final EntityFailure? failure;
  final EpisodeFilter filter;

  const EpisodesState({
    required this.episodes,
    required this.nextPage,
    this.failure,
    this.isLoading = false,
    required this.filter,
  });

  @override
  List<Object?> get props => [episodes, isLoading, failure, nextPage, filter];

  EpisodesState copyWith({
    List<EpisodeModel>? episodes,
    int? nextPage,
    EntityFailure? failure,
    bool isLoading = false,
    EpisodeFilter? filter,
  }) {
    return EpisodesState(
      episodes: episodes ?? this.episodes,
      nextPage: nextPage ?? this.nextPage,
      isLoading: isLoading,
      failure: failure,
      filter: filter ?? this.filter,
    );
  }
}
