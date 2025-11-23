import 'package:flutter/material.dart';
import 'package:flutter_weather_app/pages/home.dart';
import 'package:flutter_weather_app/pages/favorites_page.dart';
import 'package:flutter_weather_app/pages/about_page.dart';
import 'package:flutter_weather_app/pages/detail_page.dart';
import 'package:flutter_weather_app/pages/destinations_data.dart';
import 'package:flutter_weather_app/pages/auth_page.dart';
import 'package:flutter_weather_app/pages/login/user_profile.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TripGuide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),

      // page d’authentification
      home: const AuthPage(),

      // Routes pour les pages qui utilisent pushNamed
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case DetailPage.routeName:
            final destination = settings.arguments as Destination;
            return MaterialPageRoute(
              builder: (_) => DetailPage(destination: destination),
            );

          default:
            return null;
        }
      },
    );
  }
}

/// Shell principal avec la bottom bar animée
class MainShell extends StatefulWidget {
  final UserProfile userProfile;

  const MainShell({super.key, required this.userProfile});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.favorite_outline,
    Icons.info_outline,
  ];

  @override
  void initState() {
    super.initState();
    _pages = [
      Home(userProfile: widget.userProfile),
      const FavoritesPage(),
      const AboutPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        elevation: 12,
        activeColor: Colors.teal,
        inactiveColor: Colors.grey.shade400,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
