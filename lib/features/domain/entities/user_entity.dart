/// The UserEntity class represents a user with properties such as name, surname, username, and email.
library;

import 'package:flutter_clean_arc_base/index.dart';

class UserEntity extends Equatable {
  final String name;
  final String surname;
  final String username;
  final String email;

  const UserEntity({
    required this.name,
    required this.surname,
    required this.username,
    required this.email,
  });
  @override
  List<Object?> get props => [
        name,
        surname,
        username,
        email,
      ];
}
