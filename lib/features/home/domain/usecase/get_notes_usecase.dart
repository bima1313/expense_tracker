import 'package:expense_tracker/features/home/domain/entities/note.dart';
import 'package:expense_tracker/features/home/domain/repositories/note_repository.dart';

class GetNotesUsecase {
  final NoteRepository repository;

  const GetNotesUsecase({required this.repository});

  Future<Iterable<Note>> call() async {
    return await repository.getNotes();
  }
}
