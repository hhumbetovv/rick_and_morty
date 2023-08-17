import 'package:multiple_result/multiple_result.dart';

import '../failures.dart';
import '../models/response/ep_model.dart';
import '../models/response/result_model.dart';

abstract class BaseEpRepository {
  Future<Result<ResultModel, StackFailure>> getEpisodes({
    int? page,
    String? name,
    String? episode,
  });

  Future<Result<EpModel, StackFailure>> getEpisode(int id);
}
