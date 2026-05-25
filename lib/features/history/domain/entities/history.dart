import 'package:equatable/equatable.dart';

class History extends Equatable {
  final double total;
  final int transactions;
  final int month;

  const History({
    required this.total,
    required this.transactions,
    required this.month,
  });
  @override
  List<Object?> get props => [total, transactions, month];
}
