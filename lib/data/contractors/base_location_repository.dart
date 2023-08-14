import 'package:multiple_result/multiple_result.dart';

import '../failures.dart';
import '../models/response/location_model.dart';
import '../models/response/result_model.dart';

abstract class BaseLocationRepository {
  Future<Result<ResultModel, Failure>> getLocations({
    int? page,
    String? name,
    String? type,
    String? dimension,
  });

  Future<Result<LocationModel, Failure>> getLocation(int id);
}
