import 'package:expense_tracker/core/errors/failures.dart';
import 'package:expense_tracker/features/home/domain/entities/note.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

@immutable
abstract class NoteRepository {
  Future<Either<Failure, List<Note>>> getNotes();
  Future<Either<Failure, void>> createNote({required Note note});
}
