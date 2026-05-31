import 'package:expense_tracker/core/errors/failures.dart';
import 'package:expense_tracker/features/history/domain/repositories/history_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetYearsUsecase {
  final HistoryRepository historyRepository;

  const GetYearsUsecase({required this.historyRepository});

  Future<Either<DatabaseFailure, List<int>>> call() async {
    return await historyRepository.getYears();
  }
}
