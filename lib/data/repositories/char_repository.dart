import 'package:multiple_result/multiple_result.dart';

import '../../locator.dart';
import '../contractors/base_char_repository.dart';
import '../failures.dart';
import '../models/response/char_model.dart';
import '../models/response/result_model.dart';
import '../services/char_service.dart';

class CharRepository implements BaseCharRepository {
  final _charService = locator.get<CharService>();

  @override
  Future<Result<CharModel, StackFailure>> getCharacter(int id) async {
    try {
      final response = await _charService.getCharacter(id);
      return Success(response);
    } catch (err, s) {
      return Error(StackFailure(err.toString(), s.toString()));
    }
  }

  @override
  Future<Result<ResultModel, StackFailure>> getCharacters({
    int? page,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) async {
    try {
      final response = await _charService.getCharacters(
        page: page,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
      );
      return Success(response);
    } catch (err, s) {
      return Error(StackFailure(err.toString(), s.toString()));
    }
  }
}
