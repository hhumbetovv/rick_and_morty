import 'package:multiple_result/multiple_result.dart';

import '../../locator.dart';
import '../contractors/base_location_repository.dart';
import '../failures.dart';
import '../models/response/location_model.dart';
import '../models/response/result_model.dart';
import '../services/location_service.dart';

class LocationRepository implements BaseLocationRepository {
  final _locationService = locator.get<LocationService>();

  @override
  Future<Result<LocationModel, Failure>> getLocation(int id) async {
    try {
      final response = await _locationService.getLocation(id);
      return Success(response);
    } catch (err, s) {
      return Error(Failure(err.toString(), s.toString()));
    }
  }

  @override
  Future<Result<ResultModel, Failure>> getLocations({
    int? page,
    String? name,
    String? type,
    String? dimension,
  }) async {
    try {
      final response = await _locationService.getLocations(
        page: page,
        name: name,
        type: type,
        dimension: dimension,
      );
      return Success(response);
    } catch (err, s) {
      return Error(Failure(err.toString(), s.toString()));
    }
  }
}
