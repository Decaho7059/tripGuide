import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather_app/pages/destinations_data.dart';
import 'package:flutter_weather_app/pages/detail_page.dart';
import 'package:flutter_weather_app/pages/favorites_manager.dart';
import 'package:flutter_weather_app/pages/login/user_profile.dart';
import 'package:flutter_weather_app/services/support_widget.dart';

class Home extends StatefulWidget {
  final UserProfile userProfile;

  const Home({super.key, required this.userProfile});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedContinent; // null = All

  final TextEditingController _searchController = TextEditingController();

  // Liste filtrée (continent + recherche + tri)
  List<Destination> _filteredDestinations = List<Destination>.from(
    destinations,
  );

  // Message d’erreur si recherche infructueuse
  String? _searchError;

  // 'none', 'country', 'continent'
  String _currentSort = 'none';

  // ---- Gestion avatar utilisateur ----
  List<String> _avatars = [];
  late String _currentAvatarPath;

  @override
  void initState() {
    super.initState();
    _currentAvatarPath = widget.userProfile.avatarPath;
    _updateFilteredDestinations();
    _loadAvatars();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Charge tous les fichiers images dans le dossier images/avatar/
  Future<void> _loadAvatars() async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      final loadedAvatars = manifestMap.keys
          .where((String path) => path.startsWith('images/avatar/'))
          .where(
            (String path) =>
                path.toLowerCase().endsWith('.png') ||
                path.toLowerCase().endsWith('.jpg'),
          )
          .toList();

      setState(() {
        _avatars = loadedAvatars;
      });
    } catch (e) {
      debugPrint('Erreur lors du chargement des avatars: $e');
    }
  }

  /// Bottom sheet pour choisir un nouvel avatar
  void _showAvatarPicker() {
    if (_avatars.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Aucun avatar trouvé.')));
      return;
    }

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Choisir un nouvel avatar",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 220,
                child: GridView.builder(
                  itemCount: _avatars.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (_, index) {
                    final path = _avatars[index];
                    final isSelected = _currentAvatarPath == path;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentAvatarPath = path;
                        });
                        Navigator.pop(ctx);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? Colors.black
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(path),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Met à jour la liste en fonction :
  // - du continent sélectionné
  // - du texte de recherche (ville ou pays)
  // - du tri courant
  void _updateFilteredDestinations() {
    final query = _searchController.text.trim().toLowerCase();

    // 1) Filtre par continent
    List<Destination> list = selectedContinent == null
        ? List<Destination>.from(destinations)
        : destinations.where((d) => d.continent == selectedContinent).toList();

    String? error;

    // 2) Filtre par recherche (ville ou pays)
    if (query.isNotEmpty) {
      list = list.where((d) {
        final city = d.city.toLowerCase();
        final country = d.country.toLowerCase();
        return city.contains(query) || country.contains(query);
      }).toList();

      if (list.isEmpty) {
        error = 'Aucune destination trouvée pour "$query".';
      }
    }

    // 3) Application du tri
    if (_currentSort == 'country') {
      list.sort((a, b) => a.country.compareTo(b.country));
    } else if (_currentSort == 'continent') {
      list.sort((a, b) => a.continent.compareTo(b.continent));
    }

    _filteredDestinations = list;
    _searchError = error;
  }

  void _onSearchChanged(String value) {
    setState(() {
      _updateFilteredDestinations();
    });
  }

  void _openFilterSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Trier les destinations",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.flag),
              title: const Text("Par pays (A → Z)"),
              onTap: () {
                Navigator.pop(ctx);
                setState(() {
                  _currentSort = 'country';
                  _updateFilteredDestinations();
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.public),
              title: const Text("Par continent (A → Z)"),
              onTap: () {
                Navigator.pop(ctx);
                setState(() {
                  _currentSort = 'continent';
                  _updateFilteredDestinations();
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.clear),
              title: const Text("Réinitialiser le tri"),
              onTap: () {
                Navigator.pop(ctx);
                setState(() {
                  _currentSort = 'none';
                  _updateFilteredDestinations();
                });
              },
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> continents = _getContinents();
    final userName = widget.userProfile.sanitizedName;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 240, 215),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER FIXE
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, $userName",
                        style: AppWidget.headlineTextSTyle(22.0),
                      ),
                      const Text(
                        "Welcome to TripGuide",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ],
                  ),

                  // Avatar : cliquable pour changer
                  GestureDetector(
                    onTap: _showAvatarPicker,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        _currentAvatarPath,
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // CONTENU SCROLLABLE
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),

                      // BARRE DE RECHERCHE + FILTRE
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Center(
                                    child: TextField(
                                      controller: _searchController,
                                      onChanged: _onSearchChanged,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            "Search location or country...",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              GestureDetector(
                                onTap: _openFilterSheet,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Image.asset(
                                    "images/filter.png",
                                    height: 30,
                                    width: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (_searchError != null) ...[
                            const SizedBox(height: 6),
                            Text(
                              _searchError!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ],
                      ),

                      const SizedBox(height: 20.0),

                      Text(
                        "Select your next trip",
                        style: AppWidget.headlineTextSTyle(20.0),
                      ),

                      const SizedBox(height: 20.0),

                      // LISTE DES CONTINENTS (dynamiques)
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: continents.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              // Chip "All"
                              final bool isSelected = selectedContinent == null;
                              return Row(
                                children: [
                                  isSelected
                                      ? _buildSelectedChip("All")
                                      : _buildUnselectedChip(
                                          "All",
                                          onTap: () {
                                            setState(() {
                                              selectedContinent = null;
                                              _updateFilteredDestinations();
                                            });
                                          },
                                        ),
                                  const SizedBox(width: 12),
                                ],
                              );
                            } else {
                              final String continent =
                                  continents[index - 1]; // décalage
                              final bool isSelected =
                                  selectedContinent == continent;
                              return Row(
                                children: [
                                  isSelected
                                      ? _buildSelectedChip(continent)
                                      : _buildUnselectedChip(
                                          continent,
                                          onTap: () {
                                            setState(() {
                                              selectedContinent = continent;
                                              _updateFilteredDestinations();
                                            });
                                          },
                                        ),
                                  const SizedBox(width: 12),
                                ],
                              );
                            }
                          },
                        ),
                      ),

                      const SizedBox(height: 20.0),

                      Text(
                        "${_filteredDestinations.length} destination(s) found",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                          color: Color.fromARGB(180, 0, 0, 0),
                        ),
                      ),

                      const SizedBox(height: 20.0),

                      // LISTE DES CARTES (horizontal)
                      SizedBox(
                        height: 420,
                        child: _filteredDestinations.isEmpty
                            ? const Center(
                                child: Text(
                                  "Aucune destination à afficher.",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            : ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: _filteredDestinations.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 16),
                                itemBuilder: (context, index) {
                                  final destination =
                                      _filteredDestinations[index];
                                  return _buildDestinationCard(
                                    destination: destination,
                                    context: context,
                                  );
                                },
                              ),
                      ),

                      const SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Récupère la liste des continents disponibles dans les données
  List<String> _getContinents() {
    final set = <String>{};
    for (final d in destinations) {
      set.add(d.continent);
    }
    final list = set.toList();
    list.sort();
    return list;
  }

  // Chip sélectionné
  Widget _buildSelectedChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  // Chip non sélectionné
  Widget _buildUnselectedChip(String label, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(60.0),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Color.fromARGB(196, 0, 0, 0),
              fontSize: 16.0,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }

  // Carte destination
  Widget _buildDestinationCard({
    required Destination destination,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailPage.routeName,
          arguments: destination,
        );
      },
      child: SizedBox(
        width: 300,
        child: Stack(
          children: [
            Hero(
              tag: destination.heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Image.asset(
                  destination.imagePath,
                  height: 400,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(150, 0, 0, 0),
                    Color.fromARGB(30, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // coeur
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ValueListenableBuilder<Set<String>>(
                        valueListenable: FavoritesManager.favoriteIds,
                        builder: (context, favIds, _) {
                          final isFav = favIds.contains(destination.id);
                          return GestureDetector(
                            onTap: () {
                              FavoritesManager.toggleFavorite(destination.id);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(40.0),
                                color: isFav
                                    ? Colors.white.withOpacity(0.9)
                                    : Colors.transparent,
                              ),
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_outline,
                                color: isFav ? Colors.red : Colors.white,
                                size: 24.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    destination.city,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${destination.country} • ${destination.continent}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        destination.rating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${destination.reviewCount} reviews",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Poppins',
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    destination.shortDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Poppins',
                      fontSize: 13.0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(160, 0, 0, 0),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        const Text(
                          "See More",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(width: 40),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
