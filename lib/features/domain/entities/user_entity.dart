import 'package:equatable/equatable.dart';

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
