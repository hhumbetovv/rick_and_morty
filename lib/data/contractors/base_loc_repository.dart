import 'package:multiple_result/multiple_result.dart';

import '../failures.dart';
import '../models/response/loc_model.dart';
import '../models/response/result_model.dart';

abstract class BaseLocRepository {
  Future<Result<ResultModel, StackFailure>> getLocations({
    int? page,
    String? name,
    String? type,
    String? dimension,
  });

  Future<Result<LocModel, StackFailure>> getLocation(int id);
}
