import 'package:frontend/models/repositories/sharedPreferencesRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepoImp extends SharedPreferencesRepo {
  late SharedPreferences _sharedPreferences;

  SharedPreferencesRepoImp() : super();

  @override
  void setInt(key, value) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    await _sharedPreferences.setInt(key, value);
  }

  @override
  void setBool(key, value) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    await _sharedPreferences.setBool(key, value);
  }

  @override
  void setDouble(key, value) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    await _sharedPreferences.setDouble(key, value);
  }

  @override
  void setString(key, value) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    await _sharedPreferences.setString(key, value);
  }

  @override
  void setStringList(key, value) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    await _sharedPreferences.setStringList(key, value);
  }

  @override
  Future<bool?> getBool(key) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return _sharedPreferences.getBool(key);
  }

  @override
  Future<double?> getDouble(key) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return _sharedPreferences.getDouble(key);
  }

  @override
  Future<int?> getInt(key) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return _sharedPreferences.getInt(key);
  }

  @override
  Future<String?> getString(key) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return _sharedPreferences.getString(key);
  }

  @override
  Future<List<String>?> getStringList(key) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    return _sharedPreferences.getStringList(key);
  }

  @override
  init() async {}
}
