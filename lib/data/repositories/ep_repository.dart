import 'package:multiple_result/multiple_result.dart';

import '../../locator.dart';
import '../contractors/base_ep_repository.dart';
import '../failures.dart';
import '../models/response/ep_model.dart';
import '../models/response/result_model.dart';
import '../services/ep_service.dart';

class EpRepository implements BaseEpRepository {
  final _epService = getIt.get<EpService>();

  @override
  Future<Result<EpModel, StackFailure>> getEpisode(int id) async {
    try {
      final response = await _epService.getEpisode(id);
      return Success(response);
    } catch (err, s) {
      return Error(StackFailure(err.toString(), s.toString()));
    }
  }

  @override
  Future<Result<ResultModel, StackFailure>> getEpisodes({
    int? page,
    String? name,
    String? episode,
  }) async {
    try {
      final response = await _epService.getEpisodes(
        page: page,
        name: name,
        episode: episode,
      );
      return Success(response);
    } catch (err, s) {
      return Error(StackFailure(err.toString(), s.toString()));
    }
  }
}
