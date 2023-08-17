import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/config.dart';
import '../models/response/loc_model.dart';
import '../models/response/result_model.dart';

part 'loc_service.g.dart';

@RestApi(baseUrl: Configs.baseUrl)
abstract class LocService {
  factory LocService(Dio dio, {String baseUrl}) = _LocService;

  @GET(Configs.locEndPoint)
  Future<ResultModel> getLocations({
    @Query('page') int? page = 1,
    @Query('name') String? name = '',
    @Query('type') String? type = '',
    @Query('dimension') String? dimension = '',
  });

  @GET("${Configs.locEndPoint}{id}")
  Future<LocModel> getLocation(@Path("id") int id);
}
