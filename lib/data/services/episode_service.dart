import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/config.dart';
import '../models/response/episode_model.dart';
import '../models/response/result_model.dart';

part 'episode_service.g.dart';

@RestApi(baseUrl: Configs.baseUrl)
abstract class EpisodeService {
  factory EpisodeService(Dio dio, {String baseUrl}) = _EpisodeService;

  @GET(Configs.epEndPoint)
  Future<ResultModel> getEpisodes({
    @Query('page') int? page = 1,
    @Query('name') String? name = '',
    @Query('episode') String? episode = '',
  });

  @GET("${Configs.epEndPoint}{id}")
  Future<EpisodeModel> getEpisode(@Path("id") int id);
}
