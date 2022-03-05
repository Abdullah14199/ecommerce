import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/home/card_items.dart';
import 'package:ecommerce/view/widgets/home/search_text_form.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor ,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20 , right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  const [
                    TextUtlis(
                      text: "Find Your",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                      textDecoration: TextDecoration.none,
                    ),
                   SizedBox(
                      height: 5,
                    ),
                   TextUtlis(
                      text: "INSPIRATION",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28,
                      textDecoration: TextDecoration.none,
                    ),
                   SizedBox(
                      height: 20,
                    ),
                   SearchFromText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding (
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtlis(
                  text: "Categories",
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode? Colors.white : Colors.black,
                  fontSize: 20,
                  textDecoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
