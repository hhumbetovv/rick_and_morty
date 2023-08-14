import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/config.dart';
import '../models/response/character_model.dart';
import '../models/response/result_model.dart';

part 'character_service.g.dart';

@RestApi(baseUrl: Configs.baseUrl)
abstract class CharacterService {
  factory CharacterService(Dio dio, {String baseUrl}) = _CharacterService;

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
  Future<CharacterModel> getCharacter(@Path("id") int id);
}
