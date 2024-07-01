import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/prayer_guide_screen.dart';
import 'screens/meditations_screen.dart';
import 'screens/mysteries_screen.dart';
import 'screens/community_screen.dart';
import 'screens/progress_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/prayerGuide': (context) => PrayerGuideScreen(),
        '/meditations': (context) => MeditationsScreen(),
        '/mysteries': (context) => MysteriesScreen(),
        '/community': (context) => CommunityScreen(),
        '/progress': (context) => ProgressScreen(),
      },
    );
  }
}
