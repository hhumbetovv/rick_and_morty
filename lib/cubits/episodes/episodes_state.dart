part of 'episodes_cubit.dart';

class EpisodesState extends Equatable {
  final List<EpModel> episodes;
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
    List<EpModel>? episodes,
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
