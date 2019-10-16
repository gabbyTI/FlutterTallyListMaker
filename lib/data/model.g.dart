// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ItemList extends DataClass implements Insertable<ItemList> {
  final int id;
  final String itemName;
  final String noOfItems;
  final String unitPrice;
  final int checkListId;
  ItemList(
      {@required this.id,
      @required this.itemName,
      @required this.noOfItems,
      @required this.unitPrice,
      @required this.checkListId});
  factory ItemList.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ItemList(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      itemName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}item_name']),
      noOfItems: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}no_of_items']),
      unitPrice: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}unit_price']),
      checkListId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}check_list_id']),
    );
  }
  factory ItemList.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return ItemList(
      id: serializer.fromJson<int>(json['id']),
      itemName: serializer.fromJson<String>(json['itemName']),
      noOfItems: serializer.fromJson<String>(json['noOfItems']),
      unitPrice: serializer.fromJson<String>(json['unitPrice']),
      checkListId: serializer.fromJson<int>(json['checkListId']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'itemName': serializer.toJson<String>(itemName),
      'noOfItems': serializer.toJson<String>(noOfItems),
      'unitPrice': serializer.toJson<String>(unitPrice),
      'checkListId': serializer.toJson<int>(checkListId),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<ItemList>>(bool nullToAbsent) {
    return ItemListsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      itemName: itemName == null && nullToAbsent
          ? const Value.absent()
          : Value(itemName),
      noOfItems: noOfItems == null && nullToAbsent
          ? const Value.absent()
          : Value(noOfItems),
      unitPrice: unitPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(unitPrice),
      checkListId: checkListId == null && nullToAbsent
          ? const Value.absent()
          : Value(checkListId),
    ) as T;
  }

  ItemList copyWith(
          {int id,
          String itemName,
          String noOfItems,
          String unitPrice,
          int checkListId}) =>
      ItemList(
        id: id ?? this.id,
        itemName: itemName ?? this.itemName,
        noOfItems: noOfItems ?? this.noOfItems,
        unitPrice: unitPrice ?? this.unitPrice,
        checkListId: checkListId ?? this.checkListId,
      );
  @override
  String toString() {
    return (StringBuffer('ItemList(')
          ..write('id: $id, ')
          ..write('itemName: $itemName, ')
          ..write('noOfItems: $noOfItems, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('checkListId: $checkListId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          itemName.hashCode,
          $mrjc(noOfItems.hashCode,
              $mrjc(unitPrice.hashCode, checkListId.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is ItemList &&
          other.id == this.id &&
          other.itemName == this.itemName &&
          other.noOfItems == this.noOfItems &&
          other.unitPrice == this.unitPrice &&
          other.checkListId == this.checkListId);
}

class ItemListsCompanion extends UpdateCompanion<ItemList> {
  final Value<int> id;
  final Value<String> itemName;
  final Value<String> noOfItems;
  final Value<String> unitPrice;
  final Value<int> checkListId;
  const ItemListsCompanion({
    this.id = const Value.absent(),
    this.itemName = const Value.absent(),
    this.noOfItems = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.checkListId = const Value.absent(),
  });
  ItemListsCompanion.insert({
    this.id = const Value.absent(),
    @required String itemName,
    @required String noOfItems,
    @required String unitPrice,
    @required int checkListId,
  })  : itemName = Value(itemName),
        noOfItems = Value(noOfItems),
        unitPrice = Value(unitPrice),
        checkListId = Value(checkListId);
  ItemListsCompanion copyWith(
      {Value<int> id,
      Value<String> itemName,
      Value<String> noOfItems,
      Value<String> unitPrice,
      Value<int> checkListId}) {
    return ItemListsCompanion(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      noOfItems: noOfItems ?? this.noOfItems,
      unitPrice: unitPrice ?? this.unitPrice,
      checkListId: checkListId ?? this.checkListId,
    );
  }
}

class $ItemListsTable extends ItemLists
    with TableInfo<$ItemListsTable, ItemList> {
  final GeneratedDatabase _db;
  final String _alias;
  $ItemListsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _itemNameMeta = const VerificationMeta('itemName');
  GeneratedTextColumn _itemName;
  @override
  GeneratedTextColumn get itemName => _itemName ??= _constructItemName();
  GeneratedTextColumn _constructItemName() {
    return GeneratedTextColumn('item_name', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _noOfItemsMeta = const VerificationMeta('noOfItems');
  GeneratedTextColumn _noOfItems;
  @override
  GeneratedTextColumn get noOfItems => _noOfItems ??= _constructNoOfItems();
  GeneratedTextColumn _constructNoOfItems() {
    return GeneratedTextColumn(
      'no_of_items',
      $tableName,
      false,
    );
  }

  final VerificationMeta _unitPriceMeta = const VerificationMeta('unitPrice');
  GeneratedTextColumn _unitPrice;
  @override
  GeneratedTextColumn get unitPrice => _unitPrice ??= _constructUnitPrice();
  GeneratedTextColumn _constructUnitPrice() {
    return GeneratedTextColumn(
      'unit_price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _checkListIdMeta =
      const VerificationMeta('checkListId');
  GeneratedIntColumn _checkListId;
  @override
  GeneratedIntColumn get checkListId =>
      _checkListId ??= _constructCheckListId();
  GeneratedIntColumn _constructCheckListId() {
    return GeneratedIntColumn(
      'check_list_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, itemName, noOfItems, unitPrice, checkListId];
  @override
  $ItemListsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'item_lists';
  @override
  final String actualTableName = 'item_lists';
  @override
  VerificationContext validateIntegrity(ItemListsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.itemName.present) {
      context.handle(_itemNameMeta,
          itemName.isAcceptableValue(d.itemName.value, _itemNameMeta));
    } else if (itemName.isRequired && isInserting) {
      context.missing(_itemNameMeta);
    }
    if (d.noOfItems.present) {
      context.handle(_noOfItemsMeta,
          noOfItems.isAcceptableValue(d.noOfItems.value, _noOfItemsMeta));
    } else if (noOfItems.isRequired && isInserting) {
      context.missing(_noOfItemsMeta);
    }
    if (d.unitPrice.present) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableValue(d.unitPrice.value, _unitPriceMeta));
    } else if (unitPrice.isRequired && isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (d.checkListId.present) {
      context.handle(_checkListIdMeta,
          checkListId.isAcceptableValue(d.checkListId.value, _checkListIdMeta));
    } else if (checkListId.isRequired && isInserting) {
      context.missing(_checkListIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemList map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ItemList.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ItemListsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.itemName.present) {
      map['item_name'] = Variable<String, StringType>(d.itemName.value);
    }
    if (d.noOfItems.present) {
      map['no_of_items'] = Variable<String, StringType>(d.noOfItems.value);
    }
    if (d.unitPrice.present) {
      map['unit_price'] = Variable<String, StringType>(d.unitPrice.value);
    }
    if (d.checkListId.present) {
      map['check_list_id'] = Variable<int, IntType>(d.checkListId.value);
    }
    return map;
  }

  @override
  $ItemListsTable createAlias(String alias) {
    return $ItemListsTable(_db, alias);
  }
}

class CheckList extends DataClass implements Insertable<CheckList> {
  final int id;
  final String checkListName;
  final int total;
  CheckList(
      {@required this.id, @required this.checkListName, @required this.total});
  factory CheckList.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CheckList(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      checkListName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}check_list_name']),
      total: intType.mapFromDatabaseResponse(data['${effectivePrefix}total']),
    );
  }
  factory CheckList.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return CheckList(
      id: serializer.fromJson<int>(json['id']),
      checkListName: serializer.fromJson<String>(json['checkListName']),
      total: serializer.fromJson<int>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'checkListName': serializer.toJson<String>(checkListName),
      'total': serializer.toJson<int>(total),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<CheckList>>(bool nullToAbsent) {
    return CheckListsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      checkListName: checkListName == null && nullToAbsent
          ? const Value.absent()
          : Value(checkListName),
      total:
          total == null && nullToAbsent ? const Value.absent() : Value(total),
    ) as T;
  }

  CheckList copyWith({int id, String checkListName, int total}) => CheckList(
        id: id ?? this.id,
        checkListName: checkListName ?? this.checkListName,
        total: total ?? this.total,
      );
  @override
  String toString() {
    return (StringBuffer('CheckList(')
          ..write('id: $id, ')
          ..write('checkListName: $checkListName, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(checkListName.hashCode, total.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is CheckList &&
          other.id == this.id &&
          other.checkListName == this.checkListName &&
          other.total == this.total);
}

class CheckListsCompanion extends UpdateCompanion<CheckList> {
  final Value<int> id;
  final Value<String> checkListName;
  final Value<int> total;
  const CheckListsCompanion({
    this.id = const Value.absent(),
    this.checkListName = const Value.absent(),
    this.total = const Value.absent(),
  });
  CheckListsCompanion.insert({
    this.id = const Value.absent(),
    @required String checkListName,
    this.total = const Value.absent(),
  }) : checkListName = Value(checkListName);
  CheckListsCompanion copyWith(
      {Value<int> id, Value<String> checkListName, Value<int> total}) {
    return CheckListsCompanion(
      id: id ?? this.id,
      checkListName: checkListName ?? this.checkListName,
      total: total ?? this.total,
    );
  }
}

class $CheckListsTable extends CheckLists
    with TableInfo<$CheckListsTable, CheckList> {
  final GeneratedDatabase _db;
  final String _alias;
  $CheckListsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _checkListNameMeta =
      const VerificationMeta('checkListName');
  GeneratedTextColumn _checkListName;
  @override
  GeneratedTextColumn get checkListName =>
      _checkListName ??= _constructCheckListName();
  GeneratedTextColumn _constructCheckListName() {
    return GeneratedTextColumn('check_list_name', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _totalMeta = const VerificationMeta('total');
  GeneratedIntColumn _total;
  @override
  GeneratedIntColumn get total => _total ??= _constructTotal();
  GeneratedIntColumn _constructTotal() {
    return GeneratedIntColumn('total', $tableName, false,
        defaultValue: Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns => [id, checkListName, total];
  @override
  $CheckListsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'check_lists';
  @override
  final String actualTableName = 'check_lists';
  @override
  VerificationContext validateIntegrity(CheckListsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.checkListName.present) {
      context.handle(
          _checkListNameMeta,
          checkListName.isAcceptableValue(
              d.checkListName.value, _checkListNameMeta));
    } else if (checkListName.isRequired && isInserting) {
      context.missing(_checkListNameMeta);
    }
    if (d.total.present) {
      context.handle(
          _totalMeta, total.isAcceptableValue(d.total.value, _totalMeta));
    } else if (total.isRequired && isInserting) {
      context.missing(_totalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CheckList map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CheckList.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CheckListsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.checkListName.present) {
      map['check_list_name'] =
          Variable<String, StringType>(d.checkListName.value);
    }
    if (d.total.present) {
      map['total'] = Variable<int, IntType>(d.total.value);
    }
    return map;
  }

  @override
  $CheckListsTable createAlias(String alias) {
    return $CheckListsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.withDefaults(), e);
  $ItemListsTable _itemLists;
  $ItemListsTable get itemLists => _itemLists ??= $ItemListsTable(this);
  $CheckListsTable _checkLists;
  $CheckListsTable get checkLists => _checkLists ??= $CheckListsTable(this);
  CheckListDao _checkListDao;
  CheckListDao get checkListDao =>
      _checkListDao ??= CheckListDao(this as AppDatabase);
  ItemListDao _itemListDao;
  ItemListDao get itemListDao =>
      _itemListDao ??= ItemListDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [itemLists, checkLists];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$CheckListDaoMixin on DatabaseAccessor<AppDatabase> {
  $CheckListsTable get checkLists => db.checkLists;
}
mixin _$ItemListDaoMixin on DatabaseAccessor<AppDatabase> {
  $ItemListsTable get itemLists => db.itemLists;
}
