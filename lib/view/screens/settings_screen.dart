import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/logic/controllers/theme_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              ThemeController().changeTheme();
            },
              child: Text("Dark Mode",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(
              builder: (controller){
                return TextButton(onPressed: (){
                  Get.defaultDialog(
                    title: "Logout From App",
                    titleStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    middleText: "Are You Sure You Want Log Out From App?",
                    middleTextStyle:  const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.grey,
                    radius: 10,
                    textCancel: "NO",
                    cancelTextColor: Colors.white,
                    textConfirm: "YES",
                    confirmTextColor: Colors.white,
                    onCancel: (){
                      Get.back();
                    },
                    onConfirm: (){
                      controller.logoutFirebase();
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  );
                },
                  child: Text("LogOut",
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
