import 'package:equatable/equatable.dart';

class EpisodeFilter extends Equatable {
  final String name;

  const EpisodeFilter({
    this.name = '',
  });

  @override
  List<Object?> get props => [name];

  EpisodeFilter copyWith({
    String? name,
  }) {
    return EpisodeFilter(
      name: name ?? this.name,
    );
  }
}
