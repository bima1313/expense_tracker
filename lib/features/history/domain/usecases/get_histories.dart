import 'package:expense_tracker/core/errors/failures.dart';
import 'package:expense_tracker/features/history/domain/entities/history.dart';
import 'package:expense_tracker/features/history/domain/repositories/history_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetHistoriesUsecase {
  final HistoryRepository historyRepository;

  const GetHistoriesUsecase({required this.historyRepository});

  Future<Either<DatabaseFailure, List<History>>> call({
    required int year,
  }) async {
    return await historyRepository.getHistories(year: year);
  }
}
