import 'package:expense_tracker/core/errors/failures.dart';
import 'package:expense_tracker/features/history/domain/repositories/history_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetTotalUsecase {
  final HistoryRepository historyRepository;

  const GetTotalUsecase({required this.historyRepository});

  Future<Either<DatabaseFailure, double>> call({required int year}) async {
    return await historyRepository.getTotal(year: year);
  }
}
