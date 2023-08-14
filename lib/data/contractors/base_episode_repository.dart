import 'package:multiple_result/multiple_result.dart';

import '../failures.dart';
import '../models/response/episode_model.dart';
import '../models/response/result_model.dart';

abstract class BaseEpisodeRepository {
  Future<Result<ResultModel, Failure>> getEpisodes({
    int? page,
    String? name,
    String? episode,
  });

  Future<Result<EpisodeModel, Failure>> getEpisode(int id);
}
