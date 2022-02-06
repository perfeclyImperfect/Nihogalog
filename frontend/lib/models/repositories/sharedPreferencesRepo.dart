abstract class SharedPreferencesRepo {
  Future<String?> getString(key);
  Future<List<String>?> getStringList(key);
  Future<int?> getInt(key);
  Future<double?> getDouble(key);
  Future<bool?> getBool(key);

  void setInt(key, value);
  void setDouble(key, value);
  void setBool(key, value);
  void setString(key, value);
  void setStringList(key, value);

  SharedPreferencesRepo() {
    init();
  }

  init();
}
