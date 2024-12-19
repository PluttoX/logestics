import 'package:firebase_auth/firebase_auth.dart';
import 'package:logestics/features/authentication/domain/repositories/auth_repository.dart';

import '../entities/auth_failer.dart';
import 'package:either_dart/either.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<AuthFailure,UserCredential>> execute(
      String email, String password,isRememberMeMark) async {
    try {
      if(isRememberMeMark){

          await authRepository.enableLocalPersistence(Persistence.LOCAL);

      }
      // Call the authentication repo service for login
       var result=  await authRepository.login(email, password,);
       return result.fold((failer){
         return Left(failer);
       },(user){
       
         return Right(user);
       });
    } catch (e) {
      return Left(AuthFailure(message: e.toString()));
    }
  }
}
