import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

import '../Home/home_screen.dart';
import '../Login&Signup/login_screen.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashOrLoginScreen(),
    '/sign-in': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
  };
}