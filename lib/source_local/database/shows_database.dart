import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/source_local/database/tables/reviews_table.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:infinum_academy_android_flutter/source_local/database/tables/shows_table.dart';
import 'package:infinum_academy_android_flutter/source_local/database/daos/show_dao.dart';
import 'package:infinum_academy_android_flutter/source_local/database/daos/review_dao.dart';

part 'shows_database.g.dart';

final showsDatabaseProvider = Provider((ref) => ShowsDatabase());

@UseMoor(tables: [Shows, Reviews], daos: [ShowDao, ReviewDao])
class ShowsDatabase extends _$ShowsDatabase {
  ShowsDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
          ),
        );

  @override
  int get schemaVersion => 1;
}
