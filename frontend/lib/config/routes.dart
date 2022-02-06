import '../views/screens/home/home.dart';
import '../views/screens/history/history.dart';
import '../views/screens/favorite.dart';
import '../views/screens/text/text.dart';

getRoutes() {
  return {
    HomeScreen.route: (context) => const HomeScreen(),
    HistoryScreen.route: (context) => const HistoryScreen(),
    FavoriteScreen.route: (context) => const FavoriteScreen(),
    TextScreen.route: (context) => TextScreen()
  };
}
