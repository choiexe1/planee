import 'package:get_it/get_it.dart';
import 'package:planee/core/db/sqlite_database.dart';
import 'package:sqflite/sqlite_api.dart';

GetIt sl = GetIt.instance;

void injection() {
  // App Core
  sl.registerSingletonAsync<Database>(
    () => SQLiteDatabase().init(),
  );
}
