import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/utils/my_string.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/auth/Text_auth_from_field.dart';
import 'package:ecommerce/view/widgets/auth/auth_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  final controller = Get.find<AuthController>();


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text('Forgot Password' , style: TextStyle(
          color: Get.isDarkMode? pinkClr :mainColor ,
        ),
        ),
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: Icon(
          Icons.arrow_back,
          color: Get.isDarkMode? Colors.white : Colors.black ,
        ),),
      ),
        backgroundColor: context.theme.backgroundColor ,
        body: Form( key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(onPressed: (){
                    Get.back();
                }, icon: const Icon(Icons.close_rounded),
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('If you want to recover you account , then please provide your email ID below...' ,
                textAlign: TextAlign.center,
                style:TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset('assets/images/forgetpass copy.png',
                width: 200,
              ),
              const SizedBox(
                height: 50,
              ),
              AuthTextFromField(
                  controller: emailController,
                  obscureText: false,
                  validator: (value){
                    if(!RegExp(validationEmail).hasMatch(value))
                      {
                        return 'Invalid Email';
                      }else{
                      return null;
                    }
                  },
                  prefixIcon: Get.isDarkMode ? Image.asset('assets/images/email.png')
                :const Icon(
                    Icons.email,
                    color: pinkClr,
                    size: 30,
                  ),
                  suffixIcon: const Text(""),
                  hintText: 'Email',
              ),
              const SizedBox(
                height: 50,
              ),
              GetBuilder<AuthController>(builder: (_){
                return AuthButton(text: "SEND", onPressed: () {
                  if(formKey.currentState!.validate()){
                    String email = emailController.text.trim();
                    controller.resetPasswordFirebase(email);

                  }
                });
              },
              ),
            ],
          ),
      ),

    ),
    ),
    ),
    );
  }
}
