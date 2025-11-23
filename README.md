![Banner](./demo/banner.png)

🧭 TripGuide — Flutter Travel App

Une application mobile moderne de découverte de destinations, avec système de favoris, filtres, recherche intelligente, authentification personnalisée et avatars dynamiques.

🌟 Aperçu du projet

🎬 Démo de l’application :
(Ajoute tes GIF une fois générés)

Connexion / Inscription

![Login](./demo/tripGuide_login.gif)


Navigation + Recherche + Favoris

![Demo](./demo/tripGuide_app.gif)

✨ Fonctionnalités principales
🔐 Authentification

Connexion & inscription fluides

Choix du genre (Homme / Femme)

Sélection d’un avatar parmi tous les fichiers d’un dossier

Nom d’utilisateur nettoyé (sans caractères spéciaux)

🏠 Home Page

Affichage personnalisé : Hello, username 👋

Avatar cliquable pour le changer à tout moment

Barre de recherche intelligente

Recherche par ville ou pays

Message d’erreur si aucune correspondance

Filtrage dynamique par continent

Tri par pays ou continent

❤️ Gestion des Favoris

Ajouter / retirer n’importe quelle destination

Sélection multiple

Suppression groupée

Tri par :

Ville

Pays

Continent

Note

Aucun tri

Ajout de favoris directement depuis un bottom-sheet

🗺️ Page Détails

Hero animation

Description courte et longue (Read more / Read less)

Liste “Upcoming Tours” dynamique

Bouton “Random City” 🎲

Bottom sheet pour afficher toutes les destinations

🎨 UI / UX

Design moderne inspiré Travel Apps

Animations Flutter

Images optimisées

Thème cohérent

📂 Arborescence du projet
tripGuide/
│
├── lib/
│   ├── main.dart
│   ├── services/
│   │     └── support_widget.dart
│   ├── pages/
│   │     ├── home.dart
│   │     ├── detail_page.dart
│   │     ├── favorites_page.dart
│   │     ├── favorites_manager.dart
│   │     ├── about_page.dart
│   │     ├── destinations_data.dart
│   │     └── login/
│   │            ├── auth_page.dart
│   │            └── user_profile.dart
│   │
│
├── images/
│   ├── avatar/
│   │     ├── boy.png
│   │     ├── girl.png
│   │     ├── gaara.png
│   │     ├── itachi.png
│   │     ├── madara.png
│   │     ├── nagato.png
│   │     ├── pain.png
│   │     ├── kurama.png
│   │     └── hinata.png
│   │
│   ├── villes/
│   ├── pays/
│   ├── filter.png
│   ├── world.gif
│   └── newton.gif
│
├── pubspec.yaml
└── README.md

🚀 Installation
1️⃣ Cloner le projet
git clone https://github.com/decaho/tripGuide.git
cd tripGuide

2️⃣ Installer les dépendances
flutter pub get

3️⃣ Lancer l’application
flutter run

🛠️ Technologies utilisées

Flutter 3.x

Dart

Animations Flutter

Hero animations

ValueNotifier (gestion des favoris)

AssetManifest.json (chargement automatique des avatars)

Material Design

🔥 Points forts techniques
✔ Avatar dynamique via AssetManifest

Aucune liste statique → toutes les images d’un dossier sont automatiquement chargées.

✔ Favoris 100% en temps réel

Avec ValueNotifier<Set<String>>
→ ultra rapide, sans base de données.

✔ Navigation propre avec onGenerateRoute
✔ Système de tri et filtres combinés (continent + recherche + tri)
💡 Améliorations possibles

Ajouter Firebase Auth

Sauvegarder les favoris dans Firestore

Ajouter un mode sombre

Ajouter la géolocalisation

Intégrer une API météo ou Google Places

👨‍💻 Auteur

Decaho Gbegbe
🧑‍🎓 Baccalauréat en Génie Informatique — Université d’Ottawa
🔗 LinkedIn : https://linkedin.com/in/decahogbegbe

🐙 GitHub : https://github.com/Decaho7059

📜 Licence

Ce projet n’a pas encore de licence.
Tu peux ajouter la licence MIT si tu veux rendre le projet open-source.
