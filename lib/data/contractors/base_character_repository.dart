import 'package:multiple_result/multiple_result.dart';

import '../failures.dart';
import '../models/response/character_model.dart';
import '../models/response/result_model.dart';

abstract class BaseCharacterRepository {
  Future<Result<ResultModel, Failure>> getCharacters({
    int? page,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  });

  Future<Result<CharacterModel, Failure>> getCharacter(int id);
}
