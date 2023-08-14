import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/config.dart';
import '../models/response/location_model.dart';
import '../models/response/result_model.dart';

part 'location_service.g.dart';

@RestApi(baseUrl: Configs.baseUrl)
abstract class LocationService {
  factory LocationService(Dio dio, {String baseUrl}) = _LocationService;

  @GET(Configs.locEndPoint)
  Future<ResultModel> getLocations({
    @Query('page') int? page = 1,
    @Query('name') String? name = '',
    @Query('type') String? type = '',
    @Query('dimension') String? dimension = '',
  });

  @GET("${Configs.locEndPoint}{id}")
  Future<LocationModel> getLocation(@Path("id") int id);
}
