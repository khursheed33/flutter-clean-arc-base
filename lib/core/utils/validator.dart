/// The `AppValidator` class in Dart provides various static methods for validating different types of
/// input fields such as name, email, password, mobile number, address, pin code, state, city, services,
/// GST number, company name, bank name, bank account number, and IFSC code.
/// The `AppValidator` class in Dart provides various static methods for validating different types of
/// input fields such as name, email, password, mobile number, address, pin code, state, city, services,
/// GST number, company name, bank name, bank account number, and IFSC code.
class AppValidator {
  static bool isValidName(String name) {
    final pattern = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
    return pattern.hasMatch(name);
  }

  static bool isValidEmail(String email) {
    final pattern = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return pattern.hasMatch(email);
  }

  static bool moreThan8Chars(String password) {
    return password.length >= 8;
  }

  static bool smallAndUpperCase(String password) {
    final pattern = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])');
    return pattern.hasMatch(password);
  }

  static bool specialCharacter(String password) {
    final pattern = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
    return pattern.hasMatch(password);
  }

  static bool oneNumber(String password) {
    final pattern = RegExp(r'^(?=.*?[0-9])');
    return pattern.hasMatch(password);
  }

  // Field Validators
  static String? emailAddress(String? val) {
    if (val!.isEmpty) {
      return "Email cannot be empty!";
    }
    if (!AppValidator.isValidEmail(val.trim())) {
      return "Invalid email address!";
    }
    return null;
  }

  static String? password(
    String? val, {
    required bool isValidPassAndNotLogin,
  }) {
    if (val!.isEmpty) {
      return "Password cannot be empty!";
    }
    if (!isValidPassAndNotLogin) {
      return "You must follow the given pattern for password.";
    }

    return null;
  }

  static String? confirmPassword(
    String? val, {
    required bool isNotMatched,
  }) {
    if (val!.isEmpty) {
      return "Repeat password cannot be empty!";
    }
    if (isNotMatched) {
      return "Password must be same!";
    }
    return null;
  }

  static String? name(String? val) {
    if (val!.isEmpty) {
      return "Name cannot be empty!";
    }
    if (val.length < 3) {
      return "Invalid Name (should be min 3 char long)!";
    }
    return null;
  }

  static String? sellerSurname(String? val) {
    if (val!.isEmpty) {
      return "Surname cannot be empty!";
    }
    if (val.length < 3) {
      return "Invalid Surname (should be min 3 char long)!";
    }
    return null;
  }

  static String? mobileNumber(String? val) {
    if (val!.isEmpty) {
      return "Mobile No cannot be empty!";
    }
    if (val.length < 10) {
      return "Invalid Mobile No (should be min 10 digit)!";
    }
    return null;
  }

  static String? addressLine1(String? val) {
    if (val!.isEmpty) {
      return "Address Line 1 cannot be empty!";
    }
    if (val.length < 10) {
      return "Invalid Address Line 1 (should be min 10 char long)!";
    }
    return null;
  }

  static String? addressLine2(String? val) {
    if (val!.isEmpty) {
      return "Address Line 2 cannot be empty!";
    }
    if (val.length < 10) {
      return "Invalid Address Line 2 (should be min 10 char long)!";
    }
    return null;
  }

  static String? pinCode(String? val) {
    if (val!.isEmpty) {
      return "it's empty!";
    }
    if (val.length < 3) {
      return "Invalid pincode!";
    }
    return null;
  }

  static String? state(String? val) {
    if (val!.isEmpty) {
      return "it's empty!";
    }
    if (val.length < 3) {
      return "Invalid state!";
    }
    if (val.length > 30) {
      return "Must be less than 30 chars!";
    }
    return null;
  }

  static String? city(String? val) {
    if (val!.isEmpty) {
      return "it's empty!";
    }
    if (val.length < 3) {
      return "Invalid city!";
    }
    if (val.length > 30) {
      return "Must be less than 30 chars!";
    }
    return null;
  }

  static String? services(String? val) {
    if (val!.isEmpty) {
      return "Services cannot be empty!";
    }
    if (val.length < 12) {
      return "Invalid Services (should be min 12 char long)!";
    }
    return null;
  }

  static String? gst(String? val) {
    if (val!.isEmpty) {
      return "GST No cannot be empty!";
    }
    if (val.length != 15) {
      return "Invalid GST Number!";
    }
    return null;
  }

  static String? companyName(String? val) {
    if (val!.isEmpty) {
      return "Company cannot be empty!";
    }
    if (val.length < 5) {
      return "Invalid Company (should be min 5 char long)!";
    }
    return null;
  }

  static String? bankName(String? val) {
    if (val!.isEmpty) {
      return "Bank Name cannot be empty!";
    }
    if (val.length < 3) {
      return "Invalid Bank Name (should be min 3 char long)!";
    }
    return null;
  }

  static String? bankAccount(String? val) {
    if (val!.isEmpty) {
      return "Account Number cannot be empty!";
    }
    if (val.length < 9) {
      return "Invalid Account Number (should be min 9 char long)!";
    }
    return null;
  }

  static String? ifsc(String? val) {
    if (val!.isEmpty) {
      return "IFSC cannot be empty!";
    }
    if (val.length != 11) {
      return "Invalid IFSC code (should be min 11 char long)!";
    }
    return null;
  }
}
