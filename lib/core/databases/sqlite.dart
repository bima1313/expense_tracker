import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLite {
  const SQLite({this.dbPath});
  final String? dbPath;
  static Database? _db;

  Future<Database> getDb() async {
    if (_db != null) return _db!;

    _db = await _initDb();

    return _db!;
  }

  Future<void> closeDb() async {
    await _db!.close();
    _db = null;
  }

  Future<Database> _initDb() async {
    _db = await openDatabase(
      version: 1,
      dbPath ?? join(await getDatabasesPath(), 'cash_flow_database.db'),
      onCreate: (db, version) {
        return db.execute('''CREATE TABLE expense(
          id integer primary key autoincrement not null,
          title text not null,
          amount real not null,
          category text not null,          
          created_at text
          )
          ''');
      },
    );

    return _db!;
  }
}
