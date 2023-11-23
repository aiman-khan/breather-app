import 'package:breather_app/helpers/persistence/persistence_helper.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PersistenceHelper)
class PersistenceHelperImpl implements PersistenceHelper {
  late final Box<dynamic> _settingsBox;

  final _settingBoxName = 'settings';

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _settingsBox = await Hive.openBox(_settingBoxName);
  }

  @override
  Future<bool?> getBool(String key) async {
    final value = (await _settingsBox.get(key)) as bool?;
    return value;
  }

  @override
  Future<num?> getNum(String key) async {
    final value = (await _settingsBox.get(key)) as num?;
    return value;
  }

  @override
  Future<String?> getString(String key) async {
    final value = (await _settingsBox.get(key)) as String?;
    return value;
  }

  @override
  Future<void> saveBool(String key, {required bool value}) async {
    await _settingsBox.put(key, value);
  }

  @override
  Future<void> saveNum(String key, num value) async {
    await _settingsBox.put(key, value);
  }

  @override
  Future<void> saveString(String key, String value) async {
    await _settingsBox.put(key, value);
  }

  @override
  Future<void> delete(String key) async {
    await _settingsBox.delete(key);
  }

  @override
  Future<List<String>?> getList(String key) async {
    final list = (await _settingsBox.get(key)) as List<String>?;
    return list;
  }

  @override
  Future<void> saveList(String key, List<String> values) async {
    await _settingsBox.put(key, values);
  }
}
