
import 'package:easyshop/app/easy_shop/home_screen.dart';
import 'package:easyshop/app/easy_shop/login_screen.dart';
import 'package:easyshop/app/easy_shop/main_screen.dart';
import 'package:easyshop/app/easy_shop/signup_screen.dart';
import 'package:easyshop/app/provider/items_provider.dart';
import 'package:easyshop/app/provider/shopping_list_provider.dart';
import 'package:easyshop/app/provider/theme_provider.dart';
import 'package:easyshop/app/provider/user_provider.dart';
import 'package:easyshop/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("⏳ Initializing Firebase...");
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint("✅ Firebase initialized");
  } catch (e) {
    debugPrint("🔥 Firebase Init Failed: $e");
  }

  debugPrint("⏳ Initializing Hive...");
  await Hive.initFlutter();
  await Hive.openBox('shopping_lists');
  debugPrint("✅ Hive initialized");

  debugPrint("🚀 Running app...");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShoppingListProvider()),
        ChangeNotifierProvider(create: (_) => ItemsProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Color appColor = const Color(0xFF7E57C2); //
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyShop',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
            seedColor: appColor, brightness: Brightness.light),
        appBarTheme: AppBarTheme(
            backgroundColor: appColor, foregroundColor: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: appColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
            seedColor: appColor, brightness: Brightness.dark),
        appBarTheme: AppBarTheme(
            backgroundColor: appColor, foregroundColor: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: appColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
        ),
        useMaterial3: true,
      ),
      themeMode: themeProvider.themeMode,
      initialRoute: '/',
      routes: {
        "/": (context) => MainScreen(),
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignupScreen(),
        "/home": (context) => HomeScreen()
      },
    );
  }
}
