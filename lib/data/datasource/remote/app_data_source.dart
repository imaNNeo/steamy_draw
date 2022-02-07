import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:steamy_draw/data/entity/app_data_entity.dart';
import 'package:steamy_draw/data/urls.dart';


class AppDataSource {
  Future<AppDataEntity> getAppData() async {
    var response = await Dio().get(Urls.appDataUrl);
    return AppDataEntity.fromJson(jsonDecode(response.data));
  }
}