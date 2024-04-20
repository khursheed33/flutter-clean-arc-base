import 'package:flutter_clean_arc_base/index.dart';

part 'user_preferences_model.g.dart';

@JsonSerializable()
class UserPreferencesModel extends UserPreferencesEntity {
  const UserPreferencesModel({
    required super.username,
    required super.name,
    required super.surename,
    required super.themeType,
    required super.languageType,
    required super.currency,
    required super.themeColor,
  });

  factory UserPreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPreferencesModelToJson(this);
}
