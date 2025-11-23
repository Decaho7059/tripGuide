import 'package:flutter/material.dart';
import 'package:flutter_weather_app/pages/auth_page.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const AuthPage()),
      (route) => false, // supprime tout l'historique
    );
  }

  @override
  void initState() {
    super.initState();

    // Animation lente pour le background
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: -20,
      end: 20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Permet de voir l'image derrière l'appbar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          "About TripGuide",
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Déconnexion',
            onPressed: _logout,
          ),
        ],
      ),

      body: Stack(
        children: [
          /// IMAGE D’ARRIÈRE-PLAN ANIMÉE
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned.fill(
                child: Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: Opacity(
                    opacity: 1,
                    child: Image.asset("images/newton.gif", fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),

          /// CONTENU
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 40),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.88),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo Circle
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.05),
                      ),
                      child: const Icon(
                        Icons.travel_explore,
                        size: 80,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // App name & version
                  Center(
                    child: Column(
                      children: const [
                        Text(
                          "TripGuide",
                          style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Version 1.0.0",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // About section
                  const Text(
                    "About the App",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  const Text(
                    "TripGuide est une application mobile conçue pour aider les voyageurs "
                    "à explorer le monde avec des recommandations visuelles, des guides "
                    "complets, des descriptions immersives et une interface moderne.",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black87,
                      fontFamily: 'Poppins',
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Creator section
                  const Text(
                    "Creator",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  const Text(
                    "Développée par : Decaho Gbegbe\n"
                    "Baccalauréat en Génie Informatique — Université d’Ottawa (2025).\n\n"
                    "Passionné par le développement mobile, l’UI/UX, et les technologies innovantes.",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black87,
                      fontFamily: 'Poppins',
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Contact section
                  const Text(
                    "Contact",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  const Text(
                    "Email: decahoGbegbe@google.com\n"
                    "LinkedIn: linkedin.com/in/decahogbegbe\n"
                    "GitHub: github.com/Decaho7059",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black87,
                      fontFamily: 'Poppins',
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Credits
                  const Text(
                    "Credits",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  const Text(
                    "• Images libres de droits\n"
                    "• Icônes Material Icons\n"
                    "• Développé avec Flutter 3\n"
                    "• Architecture simple et modulaire",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black87,
                      fontFamily: 'Poppins',
                    ),
                  ),

                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      "© 2025 TripGuide • All rights reserved",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
