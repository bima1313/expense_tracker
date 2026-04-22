import 'package:expense_tracker/features/home/domain/entities/note.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class NoteRepository {
  Future<Note> getNotes();
}
