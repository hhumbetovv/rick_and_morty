import 'package:equatable/equatable.dart';

class CharacterFilter extends Equatable {
  final String name;
  final CharacterStatus status;
  final CharacterGender gender;

  const CharacterFilter({
    this.name = '',
    this.status = CharacterStatus.nostatus,
    this.gender = CharacterGender.nogender,
  });

  @override
  List<Object?> get props => [name, status, gender];

  CharacterFilter copyWith({
    String? name,
    CharacterStatus? status,
    CharacterGender? gender,
  }) {
    return CharacterFilter(
      name: name ?? this.name,
      status: status ?? this.status,
      gender: gender ?? this.gender,
    );
  }
}

enum CharacterStatus {
  nostatus('', "No Status Selection"),
  alive('alive', "Alive"),
  dead('dead', "Dead"),
  unknown('unknown', "unknown");

  const CharacterStatus(this.value, this.text);

  final String value;
  final String text;
}

enum CharacterGender {
  nogender('', "No Gender Selection"),
  female('female', "Female"),
  male('male', "Male"),
  genderless('genderless', "Genderless"),
  unknown('unknown', "unknown");

  const CharacterGender(this.value, this.text);

  final String value;
  final String text;
}
