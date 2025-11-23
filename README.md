🌍 TripGuide – Flutter Travel App

Une application mobile moderne pour explorer le monde, découvrir des destinations et gérer vos favoris avec une interface intuitive et animée.

<div align="center"> <img src="images/demo/tripguide_demo.gif" width="350"/> </div>
📌 Sommaire

Aperçu

Fonctionnalités

Démo

Arborescence du Projet

Installation

Technologies

Captures d’écran

Auteur

Licence

🚀 Aperçu

TripGuide est une application mobile développée en Flutter permettant :

de parcourir des destinations du monde entier,

de filtrer par continent,

de rechercher villes ou pays,

d’ajouter des favoris,

de gérer son profil (avatar, pseudonyme),

de consulter des détails enrichis avec animations.

L’application inclut une interface moderne, des animations fluides et une navigation intuitive.

✨ Fonctionnalités
🔍 Recherche intelligente

Recherche une destination par ville ou pays

Avertissement si aucun résultat trouvé

🌎 Filtres & Tri

Filtre par continent

Tri par pays, continent, ou réinitialisation

❤️ Gestion des favoris

Ajouter / retirer une destination

Voir la page Favoris

Sélection multiple (option disponible)

Tri personnalisé

👤 Profil utilisateur

Inscription + connexion

Choix du genre

Sélection d’un avatar dans une liste complète

Modification de l’avatar directement depuis la Home

📱 Pages clés

Home

Favorites

About

Detail Page

Login / Sign up

🎬 Démo GIF

Ajoute un GIF dans /images/demo/tripguide_demo.gif

Exemple :

![Demo TripGuide](images/demo/tripguide_demo.gif)

📁 Arborescence du Projet

Voici la structure recommandée :

flutter_weather_app/
│
├── images/
│   ├── filter.png
│   ├── world.gif
│   ├── newton.gif
│   ├── avatar/
│   │   ├── boy.png
│   │   ├── girl.png
│   │   ├── gaara.png
│   │   ├── itachi.png
│   │   ├── hinata.png
│   │   ├── kurama.png
│   │   ├── madara.png
│   │   ├── nagato.png
│   │   ├── orochimaru.png
│   │   └── pain.png
│   ├── villes/
│   └── Pays/
│
├── lib/
│   ├── main.dart
│   ├── services/
│   │   └── support_widget.dart
│   ├── pages/
│   │   ├── login/
│   │   │   ├── auth_page.dart
│   │   │   ├── user_profile.dart
│   │   ├── home.dart
│   │   ├── about_page.dart
│   │   ├── favorites_page.dart
│   │   ├── favorites_manager.dart
│   │   ├── detail_page.dart
│   │   └── destinations_data.dart
│
├── pubspec.yaml
└── README.md

🛠 Installation
1️⃣ Cloner le projet
git clone https://github.com/tonpseudo/TripGuide.git
cd TripGuide

2️⃣ Installer les dépendances
flutter pub get

3️⃣ Lancer l'application
flutter run

4️⃣ (Optionnel) Nettoyer le projet
flutter clean
flutter pub get

⚙ Technologies
Technologie	Utilisation
Flutter 3	Framework mobile
Dart	Langage principal
Provider / ValueNotifier	Gestion simple de l’état
Hero animations	Animations de transition
Material Design 3	UI moderne
AnimatedBottomNavigationBar	Navigation fluide
🖼 Captures d’écran

Tu peux ajouter tes screenshots ici :

images/screens/home.png
images/screens/detail.png
images/screens/login.png
images/screens/favorites.png


Exemple :

| Home | Détails | Favoris |
|------|---------|---------|
| ![](images/screens/home.png) | ![](images/screens/detail.png) | ![](images/screens/favorites.png) |

👨‍💻 Auteur

Decaho Gbegbe
Baccalauréat en Génie Informatique – Université d’Ottawa (2025)

📧 Email : decahoGbegbe@google.com

🔗 LinkedIn : https://linkedin.com/in/decahogbegbe

🐙 GitHub : https://github.com/Decaho7059

📜 Licence

Ce projet est sous licence MIT.
Vous êtes libre de l’utiliser, modifier et distribuer.
