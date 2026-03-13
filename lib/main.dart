import 'package:flutter/material.dart';
import 'package:islami/core/cache/cache_helper.dart';
import 'package:islami/features/home/screens/home_screen.dart';
import 'package:islami/features/onboarding/screens/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  
  bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  
  runApp(IslamiApp(onBoarding: onBoarding));
}

class IslamiApp extends StatelessWidget {
  final bool onBoarding;
  const IslamiApp({super.key, required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: onBoarding ? HomeScreen.routeName : OnBoardingScreen.routeName,
      routes: {
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
