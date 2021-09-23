import 'package:infinum_academy_android_flutter/source_local/database/tables/shows_table.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:infinum_academy_android_flutter/source_local/database/shows_database.dart';

part 'show_dao.g.dart';

@UseDao(tables: [Shows])
class ShowDao extends DatabaseAccessor<ShowsDatabase> with _$ShowDaoMixin {
  ShowDao(ShowsDatabase db) : super(db);

  Future<List<DBShow>> getAllShows() => select(shows).get();

  Future<void> addShows(List<Insertable<DBShow>> newShows) async {
    await batch((batch) => batch.insertAll(shows, newShows, mode: InsertMode.replace));
  }
}
