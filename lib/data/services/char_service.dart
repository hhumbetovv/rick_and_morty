import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/config.dart';
import '../models/response/char_model.dart';
import '../models/response/result_model.dart';

part 'char_service.g.dart';

@RestApi(baseUrl: Configs.baseUrl)
abstract class CharService {
  factory CharService(Dio dio, {String baseUrl}) = _CharService;

  @GET(Configs.charEndPoint)
  Future<ResultModel> getCharacters({
    @Query('page') int? page = 1,
    @Query('name') String? name = '',
    @Query('status') String? status = '',
    @Query('species') String? species = '',
    @Query('type') String? type = '',
    @Query('gender') String? gender = '',
  });

  @GET("${Configs.charEndPoint}{id}")
  Future<CharModel> getCharacter(@Path("id") int id);
}
