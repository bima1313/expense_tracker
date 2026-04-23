import 'package:expense_tracker/features/home/data/datasource/note_local_data_source.dart';
import 'package:expense_tracker/features/home/data/models/note_model.dart';
import 'package:expense_tracker/features/home/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource localDataSource;

  const NoteRepositoryImpl({required this.localDataSource});
  @override
  Future<Iterable<NoteModel>> getNotes() async {
    final data = await localDataSource.getNotes();

    return data;
  }
}
