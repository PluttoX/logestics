
import 'package:either_dart/either.dart';
import 'package:logestics/features/authentication/domain/repositories/auth_repository.dart';
import '../../domain/entities/auth_failer.dart';

class ForgetPasswordUseCase {
  final AuthRepository authRepository;

  ForgetPasswordUseCase({required this.authRepository});

  Future<Either<AuthFailure, void>> execute(String email) async {
    try {
      // Call the repository to send a password reset email
      return await authRepository.sendPasswordResetEmail(email);
    } catch (e) {
      return Left(AuthFailure(message: e.toString()));
    }
  }
}
