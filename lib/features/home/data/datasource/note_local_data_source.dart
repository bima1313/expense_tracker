import 'package:expense_tracker/core/constants/dummy_data.dart';
import 'package:expense_tracker/features/home/data/models/note_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class NoteLocalDataSource {
  Future<Iterable<NoteModel>> getNotes();
}

class MockLocalSourceImpl implements NoteLocalDataSource {
  @override
  Future<Iterable<NoteModel>> getNotes() async {
    await Future.delayed(const Duration(seconds: 2));
    final data = dummyData["data"]!.map((json) => NoteModel.fromJson(json));

    return data;
  }
}
