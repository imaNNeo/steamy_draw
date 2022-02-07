import 'package:steamy_draw/data/datasource/local/shared_pref_data_source.dart';
import 'package:steamy_draw/data/datasource/remote/app_data_source.dart';
import 'package:steamy_draw/data/entity/app_data_entity.dart';

class AppRepository {

  static final AppRepository _singleton = AppRepository._internal();

  factory AppRepository() {
    return _singleton;
  }

  AppRepository._internal();

  final _appDataSource = AppDataSource();
  final _sharedPrefDataSource = SharedPrefDataSource();

  Future<AppDataEntity> getAppData() async {
    final appData = await _sharedPrefDataSource.readAppData();
    if (appData == null) {
      return await refreshAppData();
    }
    try {
      refreshAppData();
    } catch(e) {}
    return appData;
  }

  Future<AppDataEntity> refreshAppData() async {
    final newData = await _appDataSource.getAppData();
    await _sharedPrefDataSource.writeAppData(newData);
    return newData;
  }
}
