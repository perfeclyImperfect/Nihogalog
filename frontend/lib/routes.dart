import 'screens/home.dart';
import 'screens/history.dart';
import 'screens/favorite.dart';

getRoutes() {
  return {
    HomeScreen.route: (context) => const HomeScreen(),
    HistoryScreen.route: (context) => const HistoryScreen(),
    FavoriteScreen.route: (context) => const FavoriteScreen()
  };
}
