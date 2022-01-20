import 'package:getx_shoping/model.dart';
import 'package:http/http.dart' as http;

class RemoteServies {
  static var client = http.Client();
  static Future<List<Cosmetics>> fetchProducts() async {
    var response = await client.get(Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return cosmeticsFromJson(jsonString);
    }
    return [];
  }
}
