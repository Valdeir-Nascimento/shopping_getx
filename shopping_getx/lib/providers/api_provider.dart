import 'package:http/http.dart' as http;
import 'package:shoppinggetx/models/product.dart';

class ApiProvider {
  static var client = http.Client();
  static Future<List<Product>> getProducts() async {
    var response = await client.get(
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
    if (response.statusCode == 200) {
      var json = response.body;
      print("Json $json");
      return productFromJson(json);
    } else {
      return [];
    }
  }
}
