import 'package:expense_tracker/core/errors/exceptions.dart';
import 'package:expense_tracker/core/errors/failures.dart';
import 'package:expense_tracker/features/home/data/mocks/datasource/note_local_data_source_preview.dart';
import 'package:expense_tracker/features/home/data/models/note_model.dart';
import 'package:expense_tracker/features/home/domain/entities/note.dart';
import 'package:expense_tracker/features/home/domain/repositories/note_repository.dart';
import 'package:fpdart/fpdart.dart';

class NoteRepositoryImplPreview implements NoteRepository {
  final NoteLocalDataSourcePreview localDataSource;

  const NoteRepositoryImplPreview({required this.localDataSource});
  @override
  Future<Either<Failure, List<Note>>> getNotes() async {
    try {
      final data = await localDataSource.getNotes();

      return Right(data);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> createNote({required Note note}) async {
    try {
      final noteModel = NoteModel.fromEntity(note);

      await localDataSource.createNote(note: noteModel);

      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    }
  }
}
