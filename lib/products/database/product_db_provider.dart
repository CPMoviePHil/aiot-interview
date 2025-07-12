import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/product_info.dart';

class ProductDBProvider {

  static final _databaseName = "myDatabase.db";
  static final _databaseVersion = 1;

  static final _table = "products";
  static final _columnId = "_id";
  static final _columnProductId = "martId";
  static final _columnProductFinalPrice = "finalPrice";
  static final _columnProductMarketName = "martName";
  static final _columnProductStockNumber = "stockAvailable";
  static final _columnProductPrice = "price";
  static final _columnProductMarketShortName = "martShortName";
  static final _columnProductImage = "imageUrl";

  final String _createDBStmt = '''
    CREATE TABLE $_table (
    $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
    $_columnProductId VARCHAR UNIQUE,
    $_columnProductFinalPrice INTEGER,
    $_columnProductMarketName TEXT,
    $_columnProductStockNumber INTEGER,
    $_columnProductPrice INTEGER,
    $_columnProductMarketShortName TEXT,
    $_columnProductImage TEXT
  )
  ''';

  ProductDBProvider._();

  static final ProductDBProvider instance = ProductDBProvider._();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) => db.execute(_createDBStmt),
    );
  }

  Future<void> insertList(List<ProductInfo> products) async {
    final db = await instance.database;
    final Batch batch = db.batch();

    for (ProductInfo product in products) {
      if (product.toJsonMap() != null) {
        final value = product.toJsonMap()!;
        batch.insert(_table, value, conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
    await batch.commit();
  }

  Future<List<ProductInfo>> queryList() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(_table);

    return List<ProductInfo>.generate(
        maps.length, (index) => ProductInfo((b) => b
      ..productId = maps[index][_columnProductId]
      ..productFinalPrice = maps[index][_columnProductFinalPrice]
      ..productMarketName = maps[index][_columnProductMarketName]
      ..productStockNumber = maps[index][_columnProductStockNumber]
      ..productPrice = maps[index][_columnProductPrice]
      ..productMarketShortName = maps[index][_columnProductMarketShortName]
      ..productImage = maps[index][_columnProductImage]
    ));
  }
}