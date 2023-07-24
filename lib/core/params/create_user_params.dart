import '../../features/domain/entities/user_entity.dart';

class CreateUserParams extends UserEntity {
  const CreateUserParams({
    required super.name,
    required super.surname,
    required super.username,
    required super.email,
  });
}
