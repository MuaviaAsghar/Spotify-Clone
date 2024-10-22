import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:platform_info/platform_info.dart';

import 'Constants/constant_colors.dart';
import 'Home/home_screen.dart';
import 'SplashScreen/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox('userBox');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: (kBlackColor),
        appBarTheme: const AppBarTheme(color: kBlackColor),
        colorScheme: ColorScheme.fromSeed(seedColor: kWhiteColor),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/sign-in': (context) => const HomeScreen(), // Add this route
        '/home': (context) => const HomeScreen(), // Add this route
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => const SplashOrLoginScreen(),
          );
        }
        return null;
      },
    );
  }
}

class SplashOrLoginScreen extends StatelessWidget {
  const SplashOrLoginScreen({super.key});

  Future<bool> _checkLoginStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  Future<void> _navigateBasedOnVersion(BuildContext context) async {
    final androidVersion = double.tryParse(Platform.I.version) ?? 12.0;

    if (androidVersion <= 11.0) {
      // Show splash screen for Android 11 or lower
      await Future.delayed(const Duration(seconds: 3)); // Splash screen delay
    }

    final isLoggedIn = await _checkLoginStatus();
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    _navigateBasedOnVersion(context);
    return const SplashScreen(); // This will still show for Android 11 and below
  }
}
