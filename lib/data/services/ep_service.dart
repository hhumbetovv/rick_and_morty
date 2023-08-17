import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/config.dart';
import '../models/response/ep_model.dart';
import '../models/response/result_model.dart';

part 'ep_service.g.dart';

@RestApi(baseUrl: Configs.baseUrl)
abstract class EpService {
  factory EpService(Dio dio, {String baseUrl}) = _EpService;

  @GET(Configs.epEndPoint)
  Future<ResultModel> getEpisodes({
    @Query('page') int? page = 1,
    @Query('name') String? name = '',
    @Query('episode') String? episode = '',
  });

  @GET("${Configs.epEndPoint}{id}")
  Future<EpModel> getEpisode(@Path("id") int id);
}
