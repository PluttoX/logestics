import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> fetchUserDetails(String uid, String email);
}
