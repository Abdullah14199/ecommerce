import 'package:ecommerce/model/products_model.dart';
import 'package:ecommerce/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController{
  var productList = <ProductsModel>[].obs;
  var favoritesList = <ProductsModel>[].obs;
  var isLoading = true.obs;
  var storge = GetStorage();
  var key = "FavoritesList";

  @override
  void onInit() {
    super.onInit();

    List ? storedShoppings = storge.read<List>(key);

    if(storedShoppings != null){
      favoritesList =
          storedShoppings.map((e) => ProductsModel.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async{
  var products = await ProductServices.getProduct();

    try{
      isLoading(true);
      if (products.isNotEmpty){
          productList.addAll(products);
      }
    }finally{
      isLoading(false);
    }
  }

  void manageFavorites(int productId) async{
    var existingIndex = favoritesList.indexWhere((element) => element.id == productId);

    if(existingIndex >= 0){
      favoritesList.removeAt(existingIndex);
      await storge.remove(key);
    }else{
      favoritesList
          .add(productList.firstWhere((element) => element.id == productId));
     await storge.write(key, favoritesList);
    }

  }

  bool isFavorites(int productId){
    return favoritesList.any((element) => element.id == productId);
  }

}