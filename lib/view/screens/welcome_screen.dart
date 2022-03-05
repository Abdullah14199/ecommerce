import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png' ,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: TextUtlis(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      text: 'Welcome',
                      textDecoration: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 230,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                       TextUtlis(
                          text: 'Ostoraa',
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                          fontSize: 35,
                         textDecoration: TextDecoration.none,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      TextUtlis(
                          text: 'Shop',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 35,
                          textDecoration: TextDecoration.none,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    )) ,
                  onPressed: (){
                    Get.offNamed(Routes.loginScreen);
                }, child: const TextUtlis(text: 'Get Start',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                    textDecoration: TextDecoration.none,
                ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUtlis(
                        text: "Don't have an Account?",
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: 18,
                        textDecoration: TextDecoration.none,),
                    TextButton(onPressed: (){
                      Get.offNamed(Routes.signUpScreen);
                    },
                        child: const TextUtlis(
                            text: "Sign Up",
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 18 ,
                            textDecoration: TextDecoration.underline,
                        ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
