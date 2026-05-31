import 'package:expense_tracker/core/errors/failures.dart';
import 'package:expense_tracker/features/history/domain/entities/history.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

@immutable
abstract class HistoryRepository {
  Future<Either<DatabaseFailure, List<int>>> getYears();
  Future<Either<DatabaseFailure, double>> getTotal({required int year});
  Future<Either<DatabaseFailure, List<History>>> getHistories({
    required int year,
  });
}
