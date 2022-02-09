import 'package:frontend/models/repositories/darkModeRepo.dart';
import 'package:frontend/models/repositories/sharedPreferencesRepo.dart';

class DarkModeRepoImp extends DarkModeRepo {
  SharedPreferencesRepo sharedPreferencesRepo;

  final String _key = 'darkMode';

  DarkModeRepoImp(this.sharedPreferencesRepo) : super();

  @override
  void setDarkMode(bool darkMode) {
    sharedPreferencesRepo.setBool(_key, darkMode);
  }

  @override
  init() async {
    bool tempDarkMode = await getDarkMode ?? false;

    setDarkMode(tempDarkMode);
  }

  @override
  Future<bool?> getPrivateDM() async {
    final temp = await sharedPreferencesRepo.getBool(_key);

    return temp;
  }
}
