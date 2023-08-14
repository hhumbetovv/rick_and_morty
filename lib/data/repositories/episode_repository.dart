import 'package:multiple_result/multiple_result.dart';

import '../../locator.dart';
import '../contractors/base_episode_repository.dart';
import '../failures.dart';
import '../models/response/episode_model.dart';
import '../models/response/result_model.dart';
import '../services/episode_service.dart';

class EpisodeRepository implements BaseEpisodeRepository {
  final _episodeService = locator.get<EpisodeService>();

  @override
  Future<Result<EpisodeModel, Failure>> getEpisode(int id) async {
    try {
      final response = await _episodeService.getEpisode(id);
      return Success(response);
    } catch (err, s) {
      return Error(Failure(err.toString(), s.toString()));
    }
  }

  @override
  Future<Result<ResultModel, Failure>> getEpisodes({
    int? page,
    String? name,
    String? episode,
  }) async {
    try {
      final response = await _episodeService.getEpisodes(
        page: page,
        name: name,
        episode: episode,
      );
      return Success(response);
    } catch (err, s) {
      return Error(Failure(err.toString(), s.toString()));
    }
  }
}
