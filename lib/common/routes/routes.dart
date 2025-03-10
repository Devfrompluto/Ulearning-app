import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_riverpod/common/routes/app_routes_names.dart';
import 'package:ulearning_riverpod/global.dart';
import 'package:ulearning_riverpod/pages/application/application.dart';
import 'package:ulearning_riverpod/pages/sign_in/sign_in.dart';
import 'package:ulearning_riverpod/pages/sign_up/sign_up.dart';
import 'package:ulearning_riverpod/pages/welcome/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.REGISTER, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application())
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print("clicked route is ${settings.name}");
    }
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        //if we used this app first time or not
        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
        print(deviceFirstTime);
        if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {
          bool isLoggedIn = Global.storageService.isLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
              builder: (_) => Application(),
              settings: settings,
            );
          } else {
            return MaterialPageRoute(
              builder: (_) => SignIn(),
              settings: settings,
            );
          }
        } else {
          if (kDebugMode) {
            print("App ran the first time");
          }
          return MaterialPageRoute(
            builder: (_) => result.first.page,
            settings: settings,
          );
        }
      }
    }
    return MaterialPageRoute(
      builder: (_) => Welcome(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
}
