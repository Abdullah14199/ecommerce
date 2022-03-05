import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;
  const ContainerUnder({
    required this.text,
    required this.onPressed,
    required this.textType,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration:  BoxDecoration(
        color: Get.isDarkMode ? pinkClr : mainColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextUtlis(
            text: text,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
            textDecoration: TextDecoration.none,
        ),
        TextButton(onPressed: onPressed,
          child: TextUtlis(
            text: textType,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
            textDecoration: TextDecoration.underline,
        ),
        )
      ],
    ),
    );
  }
}
