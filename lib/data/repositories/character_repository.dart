import 'package:multiple_result/multiple_result.dart';

import '../../locator.dart';
import '../contractors/base_character_repository.dart';
import '../failures.dart';
import '../models/response/character_model.dart';
import '../models/response/result_model.dart';
import '../services/character_service.dart';

class CharacterRepository implements BaseCharacterRepository {
  final _characterService = locator.get<CharacterService>();

  @override
  Future<Result<CharacterModel, Failure>> getCharacter(int id) async {
    try {
      final response = await _characterService.getCharacter(id);
      return Success(response);
    } catch (err, s) {
      return Error(Failure(err.toString(), s.toString()));
    }
  }

  @override
  Future<Result<ResultModel, Failure>> getCharacters({
    int? page,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) async {
    try {
      final response = await _characterService.getCharacters(
        page: page,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
      );
      return Success(response);
    } catch (err, s) {
      return Error(Failure(err.toString(), s.toString()));
    }
  }
}
