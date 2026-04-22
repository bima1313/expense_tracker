import 'package:expense_tracker/features/home/domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({
    required super.title,
    required super.simpleDescription,
    required super.iconName,
    required super.amount,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json["title"],
      simpleDescription: json["simple_description"],
      iconName: json["icon_name"],
      amount: json["amount"],
    );
  }
}
