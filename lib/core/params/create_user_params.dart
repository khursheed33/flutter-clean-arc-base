import 'package:flutter_clean_arc_base/index.dart';

/// The `CreateUserParams` class extends the `UserEntity` class and requires specific parameters for
/// creating a user.
class CreateUserParams extends UserEntity {
  const CreateUserParams({
    required super.name,
    required super.surname,
    required super.username,
    required super.email,
  });
}
