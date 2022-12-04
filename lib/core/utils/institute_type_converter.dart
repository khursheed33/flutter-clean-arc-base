import '../enums/institute_type.dart';

class InstituteTypeConverter {
  static InstituteType getInstituteType(String type) {
    switch (type) {
      case "School":
        return InstituteType.School;
      case "JrCollege":
        return InstituteType.JrCollege;
      case "EnggCollege":
        return InstituteType.EnggCollege;

      default:
        return InstituteType.EnggCollege;
    }
  }
}
