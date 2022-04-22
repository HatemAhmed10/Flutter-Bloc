import 'package:comics4/presentation/forgot_password/forgot_password_view.dart';
import 'package:comics4/presentation/login/login_view.dart';
import 'package:comics4/presentation/main/main_view.dart';
import 'package:comics4/presentation/register/register_view.dart';
import 'package:comics4/presentation/resources/strings_manager.dart';
import 'package:comics4/presentation/splash/splash_view.dart';
import 'package:comics4/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

import '../../modules/postview/view/postAdd.dart';
import '../../modules/postview/view/postview.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";

  static const String postRoute = "/postRoute";
  static const String postAddRoute = "/postAddRoute";


}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
        case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      case Routes.postRoute:
        return MaterialPageRoute(builder: (_) => const PostView());
      case Routes.postAddRoute:
        return MaterialPageRoute(builder: (_) => const PostAdd());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
