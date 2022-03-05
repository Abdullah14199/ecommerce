import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/my_string.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/auth/Text_auth_from_field.dart';
import 'package:ecommerce/view/widgets/auth/auth_button.dart';
import 'package:ecommerce/view/widgets/auth/check_widget.dart';
import 'package:ecommerce/view/widgets/auth/container_under.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  final fromKey = GlobalKey<FormState>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? Colors.black :Colors.white ,
            elevation: 0,
          ),
          backgroundColor: context.theme.backgroundColor ,
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
                                text: "SIGN",
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? pinkClr: mainColor ,
                                fontSize: 28,
                                textDecoration: TextDecoration.none ,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              TextUtlis(
                                text: "UP",
                                fontWeight: FontWeight.w500,
                                color:Get.isDarkMode ? Colors.white : Colors.black,
                                fontSize: 28,
                                textDecoration: TextDecoration.none ,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          AuthTextFromField(
                              controller: nameController,
                              obscureText: false,
                              validator: (value){
                                if(value.toString().length <= 2 || !RegExp(validationName).hasMatch(value)){
                                  return 'Enter Valid Name';
                                }else{
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode ? const Icon(Icons.person, color: pinkClr, size: 30,) : Image.asset('assets/images/user.png'),
                              suffixIcon: const Text(""),
                              hintText: 'User Name',
                          ),
                          const SizedBox(
                            height: 20,
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
                            prefixIcon:Get.isDarkMode ?const Icon(Icons.email , color: pinkClr, size: 30,):Image.asset('assets/images/email.png'),
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
                                prefixIcon: Get.isDarkMode ? const Icon(Icons.lock, color: pinkClr, size: 30,) :Image.asset('assets/images/lock.png'),
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
                          const SizedBox(
                            height: 50,
                          ),
                          checkedWidget(),
                          const SizedBox(
                            height: 20,
                          ),
                         GetBuilder<AuthController>(builder: (_){
                          return  AuthButton(
                            text: 'SIGN UP',
                            onPressed: () {

                              if(controller.ischecked == false){
                                Get.snackbar(
                                    "Check Box",
                                    "Please , Accept terms & conditions",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                );
                              }else if(fromKey.currentState!.validate()){
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.signUpByFirebase(
                                    name: name,
                                    email: email,
                                    password: password,
                                );
                                controller.ischecked == true;
                              }
                            },
                          );
                         },
                         ),
                        ],
                      ),
                    ),
                  ),
                ),
                ContainerUnder(
                  text: 'Already have an Account?',
                  textType: "Log in",
                  onPressed: () {
                    Get.offNamed(Routes.loginScreen);
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}