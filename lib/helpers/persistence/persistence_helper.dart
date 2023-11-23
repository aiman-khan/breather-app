abstract class PersistenceHelper {
  /// [Iitialize the persistence helper]
  Future<void> init();

  /// [Save the data]
  Future<void> saveBool(String key, {required bool value});

  /// [Save the String]
  Future<void> saveString(String key, String value);

  /// [Save the num]
  Future<void> saveNum(String key, num value);

  /// [Save a list]
  Future<void> saveList(String key, List<String> values);

  /// [Get the bool]
  Future<bool?> getBool(String key);

  /// [Get the String]
  Future<String?> getString(String key);

  /// [Get the num]
  Future<num?> getNum(String key);

  /// [Get the list]
  Future<List<String>?> getList(String key);

  /// [Delete the data]
  Future<void> delete(String key);
}
