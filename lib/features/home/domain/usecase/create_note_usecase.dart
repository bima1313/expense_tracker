import 'package:expense_tracker/core/errors/failures.dart';
import 'package:expense_tracker/features/home/domain/entities/note.dart';
import 'package:expense_tracker/features/home/domain/repositories/note_repository.dart';
import 'package:fpdart/fpdart.dart';

class CreateNoteUsecase {
  final NoteRepository repository;

  const CreateNoteUsecase({required this.repository});

  Future<Either<Failure, void>> call({required Note note}) async {
    return await repository.createNote(note: note);
  }
}
