import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/my_string.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/auth/Remember_Me_Checked.dart';
import 'package:ecommerce/view/widgets/auth/Text_auth_from_field.dart';
import 'package:ecommerce/view/widgets/auth/auth_button.dart';
import 'package:ecommerce/view/widgets/auth/container_under.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  final fromKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor ,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          elevation: 0,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25 , right: 25 , top: 40),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtlis(
                              text: "LOG",
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              fontSize: 28,
                              textDecoration: TextDecoration.none ,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtlis(
                              text: "IN",
                              fontWeight: FontWeight.w500,
                              color:Get.isDarkMode ? Colors.white : Colors.black  ,
                              fontSize: 28,
                              textDecoration: TextDecoration.none ,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFromField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value){
                            if(!RegExp(validationEmail).hasMatch(value)){
                              return 'Enter Valid Email';
                            }else{
                              return null;
                            }
                          },
                          prefixIcon:Get.isDarkMode ? const Icon(Icons.email ,
                            color: pinkClr,
                            size: 30,)
                              : Image.asset('assets/images/email.png'),
                          suffixIcon: const Text(""),
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(
                          builder:(_) {
                            return AuthTextFromField(
                              controller: passwordController,
                              obscureText: controller.isVisibilty ? false : true,
                              validator: (value){
                                if(value.toString().length <= 6){
                                  return 'Enter Strong Password';
                                }
                                else{
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode ?
                              const Icon(Icons.lock, color: pinkClr, size: 30,)  : Image.asset('assets/images/lock.png'),
                              suffixIcon:
                              IconButton(icon:  controller.isVisibilty ?
                              const Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              ) : const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                                onPressed: () {
                                  controller.visibilty();
                                },
                              ),
                              hintText: 'Password',
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(onPressed: (){
                            Get.toNamed(Routes.forgetPasswordScreen);
                          }, child: TextUtlis(
                              text: 'Forgot Password',
                              fontWeight: FontWeight.normal,
                              color: Get.isDarkMode? Colors.white : Colors.black,
                              fontSize: 14,
                              textDecoration: TextDecoration.none,
                          ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        rememberMe(),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_){
                          return AuthButton(
                            text: 'LOG IN',
                            onPressed: () {
                              if(fromKey.currentState!.validate()){
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.loginByFirebase(email: email, password: password);
                              }
                            },
                          );
                        },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextUtlis(
                          text: 'OR',
                          fontWeight: FontWeight.normal,
                          color: Get.isDarkMode? Colors.white : Colors.black,
                          fontSize: 18,
                          textDecoration: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap:(){
                                  controller.signUpByFaceBookFirebase();
                              },
                              child:Image.asset('assets/images/facebook.png'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                           GetBuilder<AuthController>(builder: (_){
                             return  InkWell(
                               onTap:(){
                                    controller.signUpByGmailFirebase();
                               },
                               child:Image.asset(
                                   'assets/images/google.png'
                               ),
                             );
                           })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Don't have an account?",
                textType: "Sign Up",
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
