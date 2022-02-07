import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:steamy_draw/data/entity/app_data_entity.dart';

class SharedPrefDataSource {
  static const _appDataKey = "app_data";
  Future<void> writeAppData(AppDataEntity appData) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = jsonEncode(appData.toJson());
    prefs.setString(_appDataKey, jsonStr);
  }

  Future<AppDataEntity?> readAppData() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final jsonStr = prefs.getString(_appDataKey);
      if (jsonStr == null || jsonStr.isEmpty) {
        return null;
      }
      return AppDataEntity.fromJson(jsonDecode(jsonStr));
    } catch (e) {
      return null;
    }
  }
}