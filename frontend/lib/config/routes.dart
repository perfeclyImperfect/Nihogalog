import '../screens/home/home.dart';
import '../screens/history.dart';
import '../screens/favorite.dart';
import '../screens/text/text.dart';

getRoutes() {
  return {
    HomeScreen.route: (context) => const HomeScreen(),
    HistoryScreen.route: (context) => const HistoryScreen(),
    FavoriteScreen.route: (context) => const FavoriteScreen(),
    TextScreen.route: (context) => TextScreen()
  };
}
