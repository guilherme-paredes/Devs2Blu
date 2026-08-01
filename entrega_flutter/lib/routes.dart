import 'package:entrega_flutter/pages/home_page.dart';
import 'package:entrega_flutter/pages/login_page.dart';
import 'package:entrega_flutter/pages/signup_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.route: (context) => LoginPage(),
    SignupPage.route: (context) => SignupPage(),
    HomePage.route: (context) => HomePage(),
  };
}
