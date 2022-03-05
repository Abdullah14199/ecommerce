import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class rememberMe extends StatelessWidget {
  rememberMe({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return  Row(
        children: [
          InkWell(
            onTap: (){
              controller.check();
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.ischecked ? Get.isDarkMode ?const Icon(Icons.done, color: pinkClr, size: 30,) : Image.asset('assets/images/check.png') : Container()
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtlis(
                  text: "Remember Me",
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.white : Colors.black ,
                  fontSize: 16,
                  textDecoration: TextDecoration.none
              ),
            ],
          ),
        ],
      );
    },
    );
  }
}
