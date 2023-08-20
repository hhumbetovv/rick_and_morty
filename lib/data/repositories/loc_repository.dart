import 'package:multiple_result/multiple_result.dart';

import '../../locator.dart';
import '../contractors/base_loc_repository.dart';
import '../failures.dart';
import '../models/response/loc_model.dart';
import '../models/response/result_model.dart';
import '../services/loc_service.dart';

class LocRepository implements BaseLocRepository {
  final _locService = getIt.get<LocService>();

  @override
  Future<Result<LocModel, StackFailure>> getLocation(int id) async {
    try {
      final response = await _locService.getLocation(id);
      return Success(response);
    } catch (err, s) {
      return Error(StackFailure(err.toString(), s.toString()));
    }
  }

  @override
  Future<Result<ResultModel, StackFailure>> getLocations({
    int? page,
    String? name,
    String? type,
    String? dimension,
  }) async {
    try {
      final response = await _locService.getLocations(
        page: page,
        name: name,
        type: type,
        dimension: dimension,
      );
      return Success(response);
    } catch (err, s) {
      return Error(StackFailure(err.toString(), s.toString()));
    }
  }
}
