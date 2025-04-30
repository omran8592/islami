import 'package:flutter/material.dart';
import 'package:islami/provider/most_recent_provider.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/home/tabs/quran/details/sura_details_screen.dart';
import 'package:islami/ui/onboarding/onboarding_screen.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool seenIntro = prefs.getBool('seenIntro') ?? false;
  runApp(ChangeNotifierProvider(
    create: (context) => MostRecentListProvider(),
    child: MyApp(seenIntro: seenIntro),
  ));
}
class MyApp extends StatelessWidget {
  final bool seenIntro;

  const MyApp({super.key, required this.seenIntro});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
      seenIntro ? HomeScreen.routeName : OnBoardingScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
