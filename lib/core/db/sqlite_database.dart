import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDatabase {
  Future<Database> init() async {
    final path = join(await getDatabasesPath(), 'planee.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE IF NOT EXISTS events (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            eventTime TEXT NOT NULL,
            location TEXT NOT NULL
          )
        ''',
        );
      },
    );
  }
}
