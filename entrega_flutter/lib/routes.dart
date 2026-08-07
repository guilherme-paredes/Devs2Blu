import 'package:entrega_flutter/features/login/pages/home_page.dart';
import 'package:entrega_flutter/features/login/pages/login_page.dart';
import 'package:entrega_flutter/features/login/pages/signup_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.route: (context) => LoginPage(),
    SignupPage.route: (context) => SignupPage(),
    HomePage.route: (context) => HomePage(),
  };
}
