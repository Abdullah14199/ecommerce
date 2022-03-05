import 'package:ecommerce/logic/bindings/auth_binding.dart';
import 'package:ecommerce/logic/bindings/main_binding.dart';
import 'package:ecommerce/logic/bindings/product_binding.dart';
import 'package:ecommerce/view/screens/auth/forgot_screen.dart';
import 'package:ecommerce/view/screens/auth/signup_screen.dart';
import 'package:ecommerce/view/screens/cart_screen.dart';
import 'package:ecommerce/view/screens/main_screen.dart';
import 'package:ecommerce/view/screens/welcome_screen.dart';
import 'package:ecommerce/view/screens/auth/login_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  static final routes = [
    GetPage(
        name: Routes.welcomeScreen,
        page: () => const welcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () =>  LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () =>  SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () =>  CartScreen(),
      binding: AuthBinding(),
    ),
  ];

}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/SignUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';

}