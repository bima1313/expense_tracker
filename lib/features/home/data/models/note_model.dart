import 'package:expense_tracker/features/home/domain/entities/note.dart';

class NoteModel extends Note {
  const NoteModel({
    required super.title,
    required super.category,
    required super.amount,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json["title"],
      category: json["category"],
      amount: json["amount"],
    );
  }
}
