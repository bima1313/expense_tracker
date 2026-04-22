import 'package:expense_tracker/features/home/data/datasource/note_local_data_source.dart';
import 'package:expense_tracker/features/home/data/models/note_model.dart';

class NoteRepositoryImpl implements NoteLocalDataSource {
  final NoteLocalDataSource localDataSource;

  const NoteRepositoryImpl(this.localDataSource);
  @override
  Future<Iterable<NoteModel>> getNotes() async {
    final data = await localDataSource.getNotes();

    return data;
  }
}
