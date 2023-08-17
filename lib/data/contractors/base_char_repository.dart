import 'package:multiple_result/multiple_result.dart';

import '../failures.dart';
import '../models/response/char_model.dart';
import '../models/response/result_model.dart';

abstract class BaseCharRepository {
  Future<Result<ResultModel, StackFailure>> getCharacters({
    int? page,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  });

  Future<Result<CharModel, StackFailure>> getCharacter(int id);
}
