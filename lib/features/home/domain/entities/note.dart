import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String title;
  final String category;
  final double amount;

  const Note({
    required this.title,
    required this.category,
    required this.amount,
  });

  @override
  List<Object?> get props => [title, category, amount];
}
