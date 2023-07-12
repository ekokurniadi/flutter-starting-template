// ignore_for_file: unnecessary_import

import 'dart:developer';
import 'dart:io';

import 'package:instapos/core/config/migrations/migrations.dart';
import 'package:instapos/core/constant/app_constant.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseConfig {
  const DatabaseConfig._();

  static Database? _database;

  static Future<Database> get database async {
    if (_database == null) {
      log(migrations.length.toString(), name: 'migration');

      String storePath = '';

      if (Platform.isWindows) {
        final directory = await getApplicationSupportDirectory();
        storePath = join(directory.path, AppConstant.instaPOSDB);

        _database = await databaseFactoryFfi.openDatabase(
          storePath,
          options: OpenDatabaseOptions(
            version: migrations.length,
            onUpgrade: (db, oldVersion, newVersion) async {
              // TODO : handle migrations here
            },
          ),
        );
      } else {
        var path = await getDatabasesPath();
        var dbPath = join(path, AppConstant.instaPOSDB);
        _database = await openDatabase(
          dbPath,
          version: migrations.length,
          onUpgrade: (Database db, int oldVersion, int newVersion) async {
            // TODO : handle migrations here
          },
        );
      }
    }

    return _database!;
  }
}
