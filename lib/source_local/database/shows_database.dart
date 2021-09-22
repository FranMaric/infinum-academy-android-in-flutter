import 'package:moor_flutter/moor_flutter.dart';
import 'package:infinum_academy_android_flutter/source_local/database/tables/shows_table.dart';

part 'shows_database.g.dart';

@UseMoor(tables: [Shows])
class ShowsDatabase extends _$ShowsDatabase {
  ShowsDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements: true,
          ),
        );

  @override
  int get schemaVersion => 1;

}
