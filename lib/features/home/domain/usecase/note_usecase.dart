import 'package:expense_tracker/features/home/domain/entities/note.dart';
import 'package:expense_tracker/features/home/domain/repositories/note_repository.dart';

class NoteUsecase {
  final NoteRepository repository;

  const NoteUsecase(this.repository);

  Future<Note> call() {
    return repository.getNotes();
  }
}
