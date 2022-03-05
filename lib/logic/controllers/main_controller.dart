import 'package:ecommerce/view/screens/category_screen.dart';
import 'package:ecommerce/view/screens/favorite_screen.dart';
import 'package:ecommerce/view/screens/home_screen.dart';
import 'package:ecommerce/view/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    FavoriteScreen(),
    const SettingScreen(),
  ].obs;

  final title = [
    'Ostora Shop',
    'Categories',
    'Favorites',
    'Settings',
  ].obs;
}