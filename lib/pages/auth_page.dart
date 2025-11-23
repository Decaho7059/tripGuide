import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/main.dart';
import 'package:flutter_weather_app/pages/login/user_profile.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // contrôleurs pour les champs
  final TextEditingController _signupNameController = TextEditingController();
  final TextEditingController _signupEmailController = TextEditingController();
  final TextEditingController _signupPasswordController =
      TextEditingController();

  final TextEditingController _loginNameController = TextEditingController();

  String _signupGender = 'male'; // 'male' ou 'female'
  String _selectedAvatar = 'images/avatar/avatar1.png';

  // Liste d’icônes au choix
  List<String> _avatars = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadAvatars();
  }

  Future<void> _loadAvatars() async {
    final manifestContent = await DefaultAssetBundle.of(
      context,
    ).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    setState(() {
      _avatars = manifestMap.keys
          .where((String path) => path.startsWith('images/avatar/'))
          .where(
            (String path) =>
                path.endsWith('.png') ||
                path.endsWith('.jpg') ||
                path.toLowerCase().endsWith('.jpeg') ||
                path.toLowerCase().endsWith('.webp'),
          )
          .toList();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _signupNameController.dispose();
    _signupEmailController.dispose();
    _signupPasswordController.dispose();
    _loginNameController.dispose();
    super.dispose();
  }

  void _goToApp(UserProfile profile) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => MainShell(userProfile: profile)),
    );
  }

  void _handleSignup() {
    final name = _signupNameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Veuillez entrer un nom.")));
      return;
    }

    final profile = UserProfile(
      rawName: name,
      gender: _signupGender,
      avatarPath: _selectedAvatar,
    );

    _goToApp(profile);
  }

  void _handleLogin() {
    final name = _loginNameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez entrer votre nom.")),
      );
      return;
    }

    //avatar par défaut
    final profile = UserProfile(
      rawName: name,
      gender: 'male',
      avatarPath: 'images/avatar/boy.png',
    );

    _goToApp(profile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 240, 215),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              "TripGuide",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
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

            const SizedBox(height: 8),
            const Text(
              "Connecte-toi ou inscris-toi pour commencer",
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
            ),
            const SizedBox(height: 16),
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: const [
                Tab(text: "Connexion"),
                Tab(text: "Inscription"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_buildLoginTab(), _buildSignupTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: _loginNameController,
            decoration: const InputDecoration(
              labelText: "Nom",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              labelText: "Mot de passe",
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: _handleLogin,
              child: const Text(
                "Se connecter",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: _signupNameController,
            decoration: const InputDecoration(
              labelText: "Nom complet",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _signupEmailController,
            decoration: const InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _signupPasswordController,
            decoration: const InputDecoration(
              labelText: "Mot de passe",
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20),

          // Genre
          const Text(
            "Genre",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ChoiceChip(
                label: const Text("Homme"),
                selected: _signupGender == 'male',
                onSelected: (_) {
                  setState(() {
                    _signupGender = 'male';
                  });
                },
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text("Femme"),
                selected: _signupGender == 'female',
                onSelected: (_) {
                  setState(() {
                    _signupGender = 'female';
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Choisis ton icône",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _avatars.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, index) {
                final path = _avatars[index];
                final isSelected = _selectedAvatar == path;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAvatar = path;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.black : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(path),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: _handleSignup,
              child: const Text(
                "S'inscrire",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
