import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/constants/text_manager.dart';

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
  nostatus('', TextManager.noStatus),
  alive('alive', TextManager.alive),
  dead('dead', TextManager.dead),
  unknown('unknown', TextManager.unknown);

  const CharacterStatus(this.value, this.text);

  final String value;
  final String text;
}

enum CharacterGender {
  nogender('', TextManager.noGender),
  female('female', TextManager.female),
  male('male', TextManager.male),
  genderless('genderless', TextManager.genderless),
  unknown('unknown', TextManager.unknown);

  const CharacterGender(this.value, this.text);

  final String value;
  final String text;
}
