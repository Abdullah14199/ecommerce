import 'package:ecommerce/logic/controllers/product_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.isLoading.value){
        return  Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor ,
          ),
        );
      }else{
        return Expanded(
          child: GridView.builder(
            itemCount: controller.productList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:200,
              childAspectRatio: 0.8,
              crossAxisSpacing: 6.0,
              mainAxisSpacing:  9.0,
            ),
            itemBuilder: (context,index){
              return buildCardItems(
                image: controller.productList[index].image,
                price: controller.productList[index].price,
                rate: controller.productList[index].rating.rate,
                productId: controller.productList[index].id,
              );
            },
          ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image, 
    required double price, 
    required double rate, 
    required int productId,
  })
  {
    return  Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
                
              )
            ],
          ),
          child: Column(
            children: [
             Obx(()=>
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     IconButton(
                       onPressed: (){
                         controller.manageFavorites(productId);
                       },
                       icon: controller.isFavorites(productId) ?
                       Icon(
                         Icons.favorite,
                         color: Colors.red,
                       ):
                       Icon(
                         Icons.favorite_outline,
                         color: Colors.black,
                       ),
                     ),
                     IconButton(
                       onPressed: (){},
                       icon: const Icon(
                         Icons.add,
                         color: Colors.black,),
                 ),
               ],
             ),
             ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15 , right: 15, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextUtlis(text: "\$ $price",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 13,
                        textDecoration: TextDecoration.none,
                    ),
                    Container(
                      height: 20,
                      width: 45,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? darkGreyClr : mainColor ,
                      borderRadius: BorderRadius.circular(10),
                    ),
                      child: Padding(padding: const EdgeInsets.only(left: 3, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          TextUtlis(
                              text: "$rate",
                              fontWeight: FontWeight.bold,
                              color: Get.isDarkMode ? Colors.white : Colors.black ,
                              fontSize: 13,
                              textDecoration: TextDecoration.none,
                          ),
                          Icon(Icons.star,size: 13,color: Get.isDarkMode ? Colors.white: Colors.black  ,)
                        ],
                      ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }

}
