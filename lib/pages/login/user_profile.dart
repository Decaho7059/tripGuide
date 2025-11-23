//import 'package:flutter/material.dart';

class UserProfile {
  final String rawName;
  final String gender; // 'male' ou 'female'
  final String avatarPath;

  UserProfile({
    required this.rawName,
    required this.gender,
    required this.avatarPath,
  });

  String get sanitizedName {
    // retire les caractères spéciaux (accents, symboles, etc.)
    return rawName.replaceAll(RegExp(r'[^A-Za-z0-9 \_]'), '');
  }
}
