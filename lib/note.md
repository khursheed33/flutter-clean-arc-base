<!-- Build Run to Generate From Json and To Json -->
flutter pub run build_runner build
flutter packages pub run build_runner build --delete-conflicting-outputs
<!--  :::::::::::::::EXAMPLE::::::::::::::

factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
 -->

 <!-- 
    :: When Using nested models ::
    @JsonSerializable(explicitToJson: true) 
  -->

  <!-- 
  ::::::::::CONVERTER::::::::::::::::::
  
class SubjectConverter
    implements JsonConverter<SubjectModel?, Map<String, dynamic>?> {
  const SubjectConverter();

  @override
  SubjectModel? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SubjectModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SubjectModel? data) {
    if (data == null) {
      return null;
    }
    return data.toJson();
  }
}

   -->

   <!-- 
    TEST UID:
    3222#ADMIN = DCCC#FIRNS
    -->

<!-- Generate Splash Icons  -->
flutter pub run flutter_native_splash:create
<!-- Flutter Launcher Icons  -->
flutter pub run flutter_launcher_icons:main


<!-- Colors with  Meaning -->
Red: Passion, Love, Anger
Orange: Energy, Happiness, Vitality
Yellow: Happiness, Hope, Deceit
Green: New Beginnings, Abundance, Nature
Blue: Calm, Responsible, Sadness
Purple: Creativity, Royalty, Wealth
Black: Mystery, Elegance, Evil
Gray: Moody, Conservative, Formality
White: Purity, Cleanliness, Virtue
Brown: Nature, Wholesomeness, Dependability
Tan or Beige: Conservative, Piety, Dull
Cream or Ivory: Calm, Elegant, Purity