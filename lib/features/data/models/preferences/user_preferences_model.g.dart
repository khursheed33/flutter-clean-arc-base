// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferencesModel _$UserPreferencesModelFromJson(
        Map<String, dynamic> json) =>
    UserPreferencesModel(
      username: json['username'] as String,
      name: json['name'] as String,
      surename: json['surename'] as String,
      themeType: $enumDecode(_$ThemeTypeEnumMap, json['themeType']),
      languageType: $enumDecode(_$LanguageTypeEnumMap, json['languageType']),
      currency: json['currency'] as String,
      themeColor: json['themeColor'] as String,
    );

Map<String, dynamic> _$UserPreferencesModelToJson(
        UserPreferencesModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'surename': instance.surename,
      'themeType': _$ThemeTypeEnumMap[instance.themeType]!,
      'languageType': _$LanguageTypeEnumMap[instance.languageType]!,
      'currency': instance.currency,
      'themeColor': instance.themeColor,
    };

const _$ThemeTypeEnumMap = {
  ThemeType.dark: 'dark',
  ThemeType.light: 'light',
  ThemeType.system: 'system',
};

const _$LanguageTypeEnumMap = {
  LanguageType.english: 'english',
  LanguageType.hindi: 'hindi',
};
