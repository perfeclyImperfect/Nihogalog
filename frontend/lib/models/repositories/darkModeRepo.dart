abstract class DarkModeRepo {
  Future<bool?> get getDarkMode => getPrivateDM();
  void setDarkMode(bool darkMode);

  DarkModeRepo() {
    init();
  }

  init();
  Future<bool?> getPrivateDM();
}
