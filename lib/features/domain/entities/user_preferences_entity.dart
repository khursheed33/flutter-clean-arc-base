import 'package:flutter_clean_arc_base/index.dart';

@immutable
class UserPreferencesEntity extends Equatable {
  final String username;
  final String name;
  final String surename;
  final ThemeType themeType;
  final LanguageType languageType;
  final String currency;
  final String themeColor;

  const UserPreferencesEntity({
    required this.username,
    required this.name,
    required this.surename,
    required this.themeType,
    required this.languageType,
    required this.currency,
    required this.themeColor,
  });

  @override
  List<Object?> get props => [
        username,
        name,
        surename,
        themeType,
        languageType,
        currency,
        themeColor,
      ];
}
