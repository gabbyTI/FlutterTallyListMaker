import 'package:moor_flutter/moor_flutter.dart';

part 'model.g.dart';

class ItemLists extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get itemName => text().withLength(min: 1)();
  TextColumn get noOfItems => text()();
  TextColumn get unitPrice => text()();
  IntColumn get checkListId => integer()();
}

class CheckLists extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get checkListName => text().withLength(min: 1)();
  IntColumn get total => integer().withDefault(Constant(0))();
}

@UseMoor(tables: [ItemLists, CheckLists], daos: [CheckListDao, ItemListDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));
  @override
  int get schemaVersion => 1;
}

@UseDao(
    tables: [CheckLists])
class CheckListDao extends DatabaseAccessor<AppDatabase>
    with _$CheckListDaoMixin {
  final AppDatabase db;

  CheckListDao(this.db) : super(db);

  Future<List<CheckList>> getAllCheckLists() => select(checkLists).get();
  Stream<List<CheckList>> watchAllCheckLists() => select(checkLists).watch();
  Future insertCheckList(Insertable<CheckList> checkList) =>
      into(checkLists).insert(checkList);
  Future updateCheckList(Insertable<CheckList> checkList) =>
      update(checkLists).replace(checkList);
  Future deleteCheckList(Insertable<CheckList> checkList) =>
      delete(checkLists).delete(checkList);
}

@UseDao(tables: [ItemLists])
class ItemListDao extends DatabaseAccessor<AppDatabase>
    with _$ItemListDaoMixin {
  final AppDatabase db;

  ItemListDao(this.db) : super(db);

  Future<List<ItemList>> getAllItemLists(int checkListId) {
    return (select(itemLists)..where((t) => t.checkListId.equals(checkListId)))
        .get();
  }

  Stream<List<ItemList>> watchAllItemLists(int checkListId) {
    return (select(itemLists)..where((t) => t.checkListId.equals(checkListId)))
        .watch();
  }

  Future insertItemList(Insertable<ItemList> itemList) =>
      into(itemLists).insert(itemList);
  Future updateItemList(Insertable<ItemList> itemList) =>
      update(itemLists).replace(itemList);
  Future deleteItemList(Insertable<ItemList> itemList) =>
      delete(itemLists).delete(itemList);
}
