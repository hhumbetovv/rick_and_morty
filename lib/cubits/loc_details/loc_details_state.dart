part of 'loc_details_cubit.dart';

class LocDetailsState extends Equatable {
  final LocModel? model;
  final bool isLoading;
  final List<CharModel> residents;
  final EntityFailure? failure;

  const LocDetailsState({
    this.model,
    this.isLoading = false,
    this.failure,
    required this.residents,
  });

  @override
  List<Object?> get props => [model, isLoading, failure, residents];

  LocDetailsState copyWith({
    LocModel? model,
    bool isLoading = false,
    EntityFailure? failure,
    List<CharModel>? residents,
  }) {
    return LocDetailsState(
      model: model,
      isLoading: isLoading,
      failure: failure,
      residents: residents ?? this.residents,
    );
  }
}
