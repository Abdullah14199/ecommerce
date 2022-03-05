import 'package:ecommerce/model/products_model.dart';
import 'package:ecommerce/utils/my_string.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future <List<ProductsModel>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if(response.statusCode == 200){
      var jsonData = response.body;
      return productsModelFromJson(jsonData);
    }else{
      return throw Exception("Faild to load products");
    }
  }
}