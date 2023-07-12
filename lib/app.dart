import 'package:instapos/core/config/database_config.dart';
import 'package:instapos/core/helpers/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'injector.dart';

class App {
  const App._();
  static late Database database;

  static Future<void> init() async {
    database = await DatabaseConfig.database;
    DioHelper.initialDio("");
    DioHelper.setDioLogger("");
    String? token = getIt<SharedPreferences>().getString("token");
    DioHelper.setDioHeader(token);
  }
}
