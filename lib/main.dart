import 'package:flutter/material.dart';
import 'package:xo_game/common/app_colors.dart';
import 'package:xo_game/screens/game_screen.dart';
import 'package:xo_game/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainColor,
          primary: AppColors.mainColor,
          secondary: AppColors.blueColor,
        ),
        useMaterial3: true,
      ),
      routes: {HomeScreen.routeName: (context) => HomeScreen(),
        GameScreen.routeName: (context) => GameScreen()
      },
      initialRoute: GameScreen.routeName,
    );
  }
}
