import '../enums/user_type.dart';

class UserTypeConverter {
  static String getUserKeyName(UserType userType) {
    switch (userType) {
      case UserType.Admin:
        return "adminUID";

      case UserType.Teacher:
        return "teacherUID";

      case UserType.Student:
        return "studentUID";

      case UserType.Parent:
        return "parentUID";

      default:
        return "managementUID";
    }
  }

  static UserType getUserType(String name) {
    switch (name) {
      case "ADMIN":
        return UserType.Admin;

      case "TEACHER":
        return UserType.Teacher;
      case "STUDENT":
        return UserType.Student;
      case "PARENT":
        return UserType.Parent;

      default:
        return UserType.Management;
    }
  }
}
