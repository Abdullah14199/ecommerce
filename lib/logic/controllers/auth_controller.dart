import 'package:ecommerce/model/faceBookModel.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{
  bool isVisibilty = false ;
  bool ischecked = false;
  var displayUserName = '';
  var displayUserPhoto = '';
  var googleSignIn = GoogleSignIn();
  var faceBookSignIn = FacebookAuth.instance;
  FaceBookModel ? faceBookModel;

  FirebaseAuth auth = FirebaseAuth.instance;

  var SignidIn = false ;
  final GetStorage authBox = GetStorage();

  void visibilty(){
    isVisibilty = !isVisibilty;
    update();
  }

  void check(){
    ischecked = !ischecked;
    update();
  }

  void signUpByFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password).then( (value) {
          displayUserName = name;
          auth.currentUser!.updateDisplayName(name);
      });
      update();

      Get.offNamed(Routes.mainScreen);
      } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message ="";
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }else{
        message = error.message.toString();
      }
      
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }



  void signUpByGmailFirebase() async{
    try{
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;

      SignidIn = true;
      authBox.write("auth", SignidIn);
      update();

      Get.offNamed(Routes.mainScreen);
    }catch(error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }


  void signUpByFaceBookFirebase() async{
    final LoginResult loginResult = await faceBookSignIn.login();
    if(loginResult.status == LoginStatus.success) {
      final data = await faceBookSignIn.getUserData();

      faceBookModel = FaceBookModel.fromJson(data);

      SignidIn = true;
      authBox.write("auth", SignidIn);

      update();
      Get.offNamed(Routes.mainScreen);
    }
  }



  void loginByFirebase({
    required String email,
    required String password,
  }
    ) async{
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value) {
        displayUserName = auth.currentUser!.displayName!;
      });


      SignidIn = true;
      authBox.write("auth", SignidIn);
      update();
      Get.offNamed(Routes.mainScreen);

    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message ="";
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }else{
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }catch(error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }

  }




  void logoutFirebase() async{
    try{
      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayUserName = '';
      displayUserPhoto = '';
      SignidIn = false;
      authBox.remove("auth");
      update();
      Get.offNamed(Routes.welcomeScreen);
    }catch(error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }



  void resetPasswordFirebase(String email) async{
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();

      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message ="";
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else{
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }catch(error){
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}