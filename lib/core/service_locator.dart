import 'package:get_it/get_it.dart';
import 'package:local_push_notifications_module/core/local_push_notifications_module.dart';
import 'package:planee/core/db/sqlite_database.dart';
import 'package:planee/data/data_sources/local_event_data_source.dart';
import 'package:planee/data/repositories/local_event_repository.dart';
import 'package:planee/domain/data_sources/event_data_source.dart';
import 'package:planee/domain/repositories/event_repository.dart';
import 'package:planee/domain/use_cases/create_event_use_case.dart';
import 'package:planee/domain/use_cases/find_upcoming_events_use_case.dart';
import 'package:planee/presentation/view_models/create_event_view_model.dart';
import 'package:planee/presentation/view_models/home_view_model.dart';
import 'package:sqflite/sqlite_api.dart';

GetIt sl = GetIt.instance;

void injection() {
  // Moduels
  LocalPushNotificationsModule.init(sl);

  sl
    ..registerSingletonAsync<Database>(
      () => SQLiteDatabase().init(),
    )
    // Data Sources
    ..registerLazySingleton<EventDataSource>(
      () => LocalEventDataSource(sl()),
    )
    // Repositories
    ..registerLazySingleton<EventRepository>(
      () => LocalEventRepository(sl()),
    )
    // Use Cases
    ..registerLazySingleton<CreateEventUseCase>(() => CreateEventUseCase(sl()))
    ..registerLazySingleton<FindUpcomingEventsUseCase>(
      () => FindUpcomingEventsUseCase(sl()),
    )
    // View Models
    ..registerFactory<CreateEventViewModel>(
      () => CreateEventViewModel(sl(), sl()),
    )
    ..registerFactory<HomeViewModel>(
      () => HomeViewModel(sl()),
    );
}
