import 'package:flutter/material.dart';

// Import semua screen yang kamu punya
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/number_types_screen.dart';
import 'screens/stopwatch_screen.dart';
import 'screens/tracking_lbs_screen.dart';
import 'screens/time_conversion_screen.dart';
import 'screens/recommendation_screen.dart';
import 'screens/members_screen.dart';
import 'screens/help_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Mobile Kelompok',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,  
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/stopwatch': (context) => StopwatchScreen(),
        '/number-types': (context) => NumberTypesScreen(),
        '/tracking-lbs': (context) => TrackingLBSScreen(),
        '/time-conversion': (context) => TimeConversionScreen(),
        '/recommendation': (context) => RecommendationScreen(),
        '/members': (context) => MembersScreen(),
        '/help': (context) => HelpScreen(),
      },
    );
  }
}
