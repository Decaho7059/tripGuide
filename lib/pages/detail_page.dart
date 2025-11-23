import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/pages/destinations_data.dart';
import 'package:flutter_weather_app/pages/favorites_manager.dart';
import 'package:flutter_weather_app/services/support_widget.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/details';

  final Destination destination;

  const DetailPage({super.key, required this.destination});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _showMore = false; // pour Read more / Read less

  late List<Destination> _shuffledDestinations;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    // Copie de la liste globale pour pouvoir la mélanger sans modifier l’originale
    _shuffledDestinations = List<Destination>.from(destinations);
    _shuffledDestinations.shuffle(_random);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final destination = widget.destination;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openRandomDestination,
        icon: const Icon(Icons.casino),
        label: const Text("Random city"),
      ),
      body: Stack(
        children: [
          // IMAGE DU HAUT AVEC HERO
          Hero(
            tag: destination.heroTag,
            child: Image.asset(
              destination.imagePath,
              height: size.height / 3,
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),

          // BOUTONS RETOUR + FAVORI
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),

                // --- Bouton favori synchronisé avec FavoritesManager ---
                ValueListenableBuilder<Set<String>>(
                  valueListenable: FavoritesManager.favoriteIds,
                  builder: (context, favIds, _) {
                    final isFav = favIds.contains(destination.id);
                    return GestureDetector(
                      onTap: () {
                        FavoritesManager.toggleFavorite(destination.id);
                      },
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_outline,
                          color: isFav ? Colors.red : Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // PANNEAU INFÉRIEUR
          Container(
            margin: EdgeInsets.only(top: size.height / 3.4),
            width: size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 238, 246, 238),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITRE + RATING
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        destination.city,
                        style: AppWidget.headlineTextSTyle(24.0),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(82, 0, 0, 0),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star_outline),
                            const SizedBox(width: 5.0),
                            Text(
                              destination.rating.toStringAsFixed(1),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10.0),

                  // PAYS + DRAPEAU + REVIEWS
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          destination.flagPath,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        destination.country,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${destination.reviewCount} review",
                        style: const TextStyle(
                          color: Color.fromARGB(172, 0, 0, 0),
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10.0),

                  // DESCRIPTION COURTE
                  Text(
                    destination.shortDescription,
                    style: const TextStyle(
                      color: Color.fromARGB(172, 0, 0, 0),
                      fontSize: 15.0,
                      fontFamily: 'Poppins',
                    ),
                  ),

                  const SizedBox(height: 10.0),

                  // "READ MORE"
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showMore = !_showMore;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _showMore ? "Read less" : "Read more",
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(172, 0, 0, 0),
                            fontSize: 15.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          _showMore
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 18,
                          color: const Color.fromARGB(172, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8.0),

                  // DESCRIPTION LONGUE – seulement si _showMore == true
                  if (_showMore)
                    Text(
                      destination.longDescription,
                      style: const TextStyle(
                        color: Color.fromARGB(172, 0, 0, 0),
                        fontSize: 14.0,
                        fontFamily: 'Poppins',
                      ),
                    ),

                  const SizedBox(height: 20.0),

                  // UPCOMING TOURS HEADER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming tours",
                        style: AppWidget.headlineTextSTyle(22.0),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _shuffledDestinations.shuffle(_random);
                              });
                            },
                            child: const Icon(
                              Icons.shuffle,
                              size: 22,
                              color: Color.fromARGB(172, 0, 0, 0),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: () {
                              _showAllDestinationsSheet(context, size);
                            },
                            child: const Text(
                              "See all",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(172, 0, 0, 0),
                                fontSize: 16.0,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20.0),

                  // LISTE HORIZONTALE DE TOURS (villes mélangées)
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _shuffledDestinations.length,
                      itemBuilder: (ctx, index) {
                        final dest = _shuffledDestinations[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            right: index == _shuffledDestinations.length - 1
                                ? 0
                                : 20.0,
                          ),
                          child: _buildTourCard(ctx, dest),
                        );
                      },
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

  /// Carte pour une destination dans "Upcoming tours"
  Widget _buildTourCard(BuildContext context, Destination dest) {
    return GestureDetector(
      onTap: () {
        // on ouvre la présentation de cette ville
        Navigator.pushReplacementNamed(
          context,
          DetailPage.routeName,
          arguments: dest,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                dest.imagePath,
                height: 180,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(dest.city, style: AppWidget.headlineTextSTyle(20.0)),
            const SizedBox(height: 4.0),
            Text(
              dest.country,
              style: const TextStyle(
                color: Color.fromARGB(160, 0, 0, 0),
                fontSize: 14.0,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                const Icon(Icons.star_outline),
                const SizedBox(width: 4.0),
                Text(
                  dest.rating.toStringAsFixed(1),
                  style: const TextStyle(fontFamily: 'Poppins'),
                ),
                const SizedBox(width: 10.0),
                Text(
                  "${dest.reviewCount} review",
                  style: const TextStyle(
                    color: Color.fromARGB(172, 0, 0, 0),
                    fontSize: 14.0,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Bottom sheet "See all" avec la liste complète (mélangée)
  void _showAllDestinationsSheet(BuildContext context, Size size) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SizedBox(
          height: size.height * 0.8,
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "All destinations",
                style: AppWidget.headlineTextSTyle(22.0),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: _shuffledDestinations.length,
                  itemBuilder: (ctx2, index) {
                    final dest = _shuffledDestinations[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          dest.imagePath,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(dest.city),
                      subtitle: Text(dest.country),
                      onTap: () {
                        Navigator.pop(ctx); // ferme le bottom sheet
                        Navigator.pushReplacementNamed(
                          context,
                          DetailPage.routeName,
                          arguments: dest,
                        );
                      },
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

  /// Ouvre une destination aléatoire
  void _openRandomDestination() {
    if (_shuffledDestinations.isEmpty) return;

    final dest =
        _shuffledDestinations[_random.nextInt(_shuffledDestinations.length)];

    Navigator.pushReplacementNamed(
      context,
      DetailPage.routeName,
      arguments: dest,
    );
  }
}
