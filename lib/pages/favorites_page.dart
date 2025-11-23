import 'package:flutter/material.dart';
import 'package:flutter_weather_app/pages/destinations_data.dart';
import 'package:flutter_weather_app/pages/detail_page.dart';
import 'package:flutter_weather_app/pages/favorites_manager.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // 'none', 'city', 'country', 'continent', 'rating'
  String _sortMode = 'none';

  bool _selectionMode = false;
  final Set<String> _selectedIds = <String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _selectionMode
            ? Text(
                "${_selectedIds.length} sélectionné(s)",
                style: const TextStyle(fontFamily: 'Poppins'),
              )
            : const Text("Favorites", style: TextStyle(fontFamily: 'Poppins')),
        actions: [
          if (!_selectionMode)
            PopupMenuButton<String>(
              icon: const Icon(Icons.sort),
              onSelected: (value) {
                setState(() {
                  _sortMode = value;
                });
              },
              itemBuilder: (ctx) => const [
                PopupMenuItem(value: 'city', child: Text("Trier par ville")),
                PopupMenuItem(value: 'country', child: Text("Trier par pays")),
                PopupMenuItem(
                  value: 'continent',
                  child: Text("Trier par continent"),
                ),
                PopupMenuItem(value: 'rating', child: Text("Trier par note")),
                PopupMenuItem(value: 'none', child: Text("Aucun tri")),
              ],
            ),
          IconButton(
            icon: Icon(_selectionMode ? Icons.close : Icons.check_box),
            onPressed: () {
              setState(() {
                _selectionMode = !_selectionMode;
                _selectedIds.clear();
              });
            },
          ),
          if (_selectionMode && _selectedIds.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: _deleteSelected,
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddFavoritesSheet,
        icon: const Icon(Icons.add),
        label: const Text("Ajouter"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("images/world.gif", fit: BoxFit.cover),
          ),
          Container(color: Colors.black.withOpacity(0.35)),
          ValueListenableBuilder<Set<String>>(
            valueListenable: FavoritesManager.favoriteIds,
            builder: (context, favIds, _) {
              final favoritesList = _buildSortedFavorites(favIds);

              if (favoritesList.isEmpty) {
                return const Center(
                  child: Text(
                    'Aucun favori pour le moment.\nAjoute des destinations depuis la Home ❤️',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: favoritesList.length,
                itemBuilder: (ctx, index) {
                  final dest = favoritesList[index];
                  final isSelected = _selectedIds.contains(dest.id);

                  return Card(
                    color: Colors.white.withOpacity(0.92),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          dest.imagePath,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        dest.city,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        "${dest.country} • ${dest.continent}",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                        ),
                      ),
                      trailing: _selectionMode
                          ? Checkbox(
                              value: isSelected,
                              onChanged: (val) {
                                setState(() {
                                  if (val == true) {
                                    _selectedIds.add(dest.id);
                                  } else {
                                    _selectedIds.remove(dest.id);
                                  }
                                });
                              },
                            )
                          : IconButton(
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                FavoritesManager.removeFavorite(dest.id);
                              },
                            ),
                      selected: _selectionMode && isSelected,
                      onTap: () {
                        if (_selectionMode) {
                          setState(() {
                            if (isSelected) {
                              _selectedIds.remove(dest.id);
                            } else {
                              _selectedIds.add(dest.id);
                            }
                          });
                        } else {
                          Navigator.pushNamed(
                            context,
                            DetailPage.routeName,
                            arguments: dest,
                          );
                        }
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  List<Destination> _buildSortedFavorites(Set<String> favIds) {
    final list = destinations
        .where((d) => favIds.contains(d.id))
        .toList(growable: false);

    switch (_sortMode) {
      case 'city':
        list.sort((a, b) => a.city.compareTo(b.city));
        break;
      case 'country':
        list.sort((a, b) => a.country.compareTo(b.country));
        break;
      case 'continent':
        list.sort((a, b) => a.continent.compareTo(b.continent));
        break;
      case 'rating':
        list.sort((b, a) => a.rating.compareTo(b.rating));
        break;
      case 'none':
      default:
        break;
    }

    return list;
  }

  void _deleteSelected() {
    if (_selectedIds.isEmpty) return;
    FavoritesManager.removeMany(_selectedIds);
    setState(() {
      _selectedIds.clear();
      _selectionMode = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Favoris sélectionnés supprimés.')),
    );
  }

  void _openAddFavoritesSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.7,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (ctx2, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Column(
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
                    "Ajouter / retirer des favoris",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ValueListenableBuilder<Set<String>>(
                      valueListenable: FavoritesManager.favoriteIds,
                      builder: (context, favIds, _) {
                        return ListView.builder(
                          controller: scrollController,
                          itemCount: destinations.length,
                          itemBuilder: (ctx3, index) {
                            final dest = destinations[index];
                            final isFav = favIds.contains(dest.id);
                            return CheckboxListTile(
                              value: isFav,
                              onChanged: (val) {
                                if (val == true) {
                                  FavoritesManager.addFavorite(dest.id);
                                } else {
                                  FavoritesManager.removeFavorite(dest.id);
                                }
                              },
                              title: Text(
                                dest.city,
                                style: const TextStyle(fontFamily: 'Poppins'),
                              ),
                              subtitle: Text(
                                dest.country,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                ),
                              ),
                              secondary: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  dest.imagePath,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, right: 16),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () => Navigator.pop(ctx),
                        icon: const Icon(Icons.check),
                        label: const Text(
                          "Terminé",
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
