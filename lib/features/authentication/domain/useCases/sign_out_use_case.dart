import 'package:either_dart/either.dart';
import '../../domain/entities/auth_failer.dart';
import '../../domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository authRepository;

  SignOutUseCase(this.authRepository);

  Future<Either<AuthFailure, void>> execute() async {

    return await authRepository.signOut();
  }
}
