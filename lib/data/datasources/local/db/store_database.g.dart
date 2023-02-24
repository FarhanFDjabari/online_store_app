// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorStoreDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$StoreDatabaseBuilder databaseBuilder(String name) =>
      _$StoreDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$StoreDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$StoreDatabaseBuilder(null);
}

class _$StoreDatabaseBuilder {
  _$StoreDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$StoreDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$StoreDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<StoreDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$StoreDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$StoreDatabase extends StoreDatabase {
  _$StoreDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CartDao? _cartDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cart` (`id` INTEGER NOT NULL, `products` TEXT, `total` INTEGER, `discountedTotal` INTEGER, `userId` INTEGER, `totalProducts` INTEGER, `totalQuantity` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CartDao get cartDao {
    return _cartDaoInstance ??= _$CartDao(database, changeListener);
  }
}

class _$CartDao extends CartDao {
  _$CartDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _cartTableInsertionAdapter = InsertionAdapter(
            database,
            'cart',
            (CartTable item) => <String, Object?>{
                  'id': item.id,
                  'products': item.products,
                  'total': item.total,
                  'discountedTotal': item.discountedTotal,
                  'userId': item.userId,
                  'totalProducts': item.totalProducts,
                  'totalQuantity': item.totalQuantity
                }),
        _cartTableUpdateAdapter = UpdateAdapter(
            database,
            'cart',
            ['id'],
            (CartTable item) => <String, Object?>{
                  'id': item.id,
                  'products': item.products,
                  'total': item.total,
                  'discountedTotal': item.discountedTotal,
                  'userId': item.userId,
                  'totalProducts': item.totalProducts,
                  'totalQuantity': item.totalQuantity
                }),
        _cartTableDeletionAdapter = DeletionAdapter(
            database,
            'cart',
            ['id'],
            (CartTable item) => <String, Object?>{
                  'id': item.id,
                  'products': item.products,
                  'total': item.total,
                  'discountedTotal': item.discountedTotal,
                  'userId': item.userId,
                  'totalProducts': item.totalProducts,
                  'totalQuantity': item.totalQuantity
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CartTable> _cartTableInsertionAdapter;

  final UpdateAdapter<CartTable> _cartTableUpdateAdapter;

  final DeletionAdapter<CartTable> _cartTableDeletionAdapter;

  @override
  Future<List<CartTable>> getAllCart() async {
    return _queryAdapter.queryList('SELECT * FROM cart',
        mapper: (Map<String, Object?> row) => CartTable(
            id: row['id'] as int,
            products: row['products'] as String?,
            total: row['total'] as int?,
            discountedTotal: row['discountedTotal'] as int?,
            userId: row['userId'] as int?,
            totalProducts: row['totalProducts'] as int?,
            totalQuantity: row['totalQuantity'] as int?));
  }

  @override
  Future<CartTable?> getCartById(int cartId) async {
    return _queryAdapter.query('SELECT * FROM cart WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CartTable(
            id: row['id'] as int,
            products: row['products'] as String?,
            total: row['total'] as int?,
            discountedTotal: row['discountedTotal'] as int?,
            userId: row['userId'] as int?,
            totalProducts: row['totalProducts'] as int?,
            totalQuantity: row['totalQuantity'] as int?),
        arguments: [cartId]);
  }

  @override
  Future<void> saveCart(CartTable cart) async {
    await _cartTableInsertionAdapter.insert(cart, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateCart(CartTable cart) async {
    await _cartTableUpdateAdapter.update(cart, OnConflictStrategy.fail);
  }

  @override
  Future<void> deleteCart(CartTable cart) async {
    await _cartTableDeletionAdapter.delete(cart);
  }
}
