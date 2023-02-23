import 'dart:async';

import 'package:floor/floor.dart';
import 'package:online_order_app/data/datasources/local/dao/cart_dao.dart';
import 'package:online_order_app/data/models/cart_table.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'store_database.g.dart';

@Database(version: 1, entities: [CartTable])
abstract class StoreDatabase extends FloorDatabase {
  CartDao get cartDao;
}
