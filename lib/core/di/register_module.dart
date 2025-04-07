import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@module
abstract class RegisterModule {
  @injectable
  Logger get logger => Logger();

  @injectable
  Dio get dio => Dio();

  @preResolve
  Future<Database> get database async => openDatabase(
    join(await getDatabasesPath(), 'exchanges_app.db'),
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          login TEXT,
          password TEXT
        )
      ''');
      await db.execute('''
          CREATE TABLE cryptocurrencies (
            id TEXT PRIMARY KEY,
            rank TEXT,
            symbol TEXT,
            name TEXT,
            supply TEXT,
            maxSupply TEXT,
            marketCapUsd TEXT,
            volumeUsd24Hr TEXT,
            priceUsd TEXT,
            changePercent24Hr TEXT,
            vwap24Hr TEXT,
            explorer TEXT
          )
        ''');
    },
    version: 1,
  );
}
