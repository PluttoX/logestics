import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:logestics/core/router/app_routes.dart';
import 'package:get/get.dart';
class FirebaseAuthService extends GetxController {
  var isUserAlreadyLogin = false;
   Rx<User?> _user=null.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? get currentUser => _user.value;
  @override
  void onInit() {
    enableLocalPersistence();
    super.onInit();
  }
Future<void> enableLocalPersistence({ Persistence persistence=Persistence.NONE})async{
    try {
      await auth.setPersistence(persistence);
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
  // auth.authStateChanges();
  @override
  void onReady() {

    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());

    ever(_user, initialScreen);
  }

  initialScreen(User? user) {
    if (user == null) {
      //login page
      if(Get.currentRoute!=AppRoutes.login)
      {Get.offAllNamed(AppRoutes.login);}

    } else {
      if(Get.currentRoute!=AppRoutes.home){
      Get.offAllNamed(AppRoutes.home);}
    }
  }


  Future<UserCredential> login({required String email, required String password}) async {
    try {
      // Attempt to sign in with email and password
     var result=  await auth.signInWithEmailAndPassword(email: email, password: password);
     return result;
    } on FirebaseAuthException {
      rethrow;
    }catch (e){
      rethrow;
    }
  }
  Future<void> signOut() async {
    try {
      await auth.signOut();
    }catch(e){
      rethrow ;
    }
  }

}