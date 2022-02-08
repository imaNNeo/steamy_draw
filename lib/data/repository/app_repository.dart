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
    final cachedAppData = await _sharedPrefDataSource.readAppData();
    if (cachedAppData == null) {
      return await _refreshAppData();
    }

    if (await _isAppDataExpired(cachedAppData)) {
      return await _refreshAppData();
    }

    return cachedAppData;
  }

  Future<bool> _isAppDataExpired(AppDataEntity appData) async {
    final currentTimeStamp = DateTime.now().millisecondsSinceEpoch;
    final diff = currentTimeStamp - (await _sharedPrefDataSource.getAppDataLastWriteTime());
    return diff > appData.expiresAfter;
  }

  Future<AppDataEntity> _refreshAppData() async {
    final newData = await _appDataSource.getAppData();
    await _sharedPrefDataSource.writeAppData(newData);
    return newData;
  }
}
