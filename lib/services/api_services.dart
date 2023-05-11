import 'dart:convert';
import '../utils/common_import.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  static Future<List<Product>> getProduct() async {
    List<Product> products = [];
    try {
      final response = await http.get(Uri.parse(AppApi.productList));
      debugPrint('request ${response.request}');
      debugPrint('request ${response.body}');
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        products = List<Product>.from(jsonResponse["data"].map((x) => Product.fromJson(x)));
      } else {
        CommonMethod.showToast(AppStrings.somethingWentToWrong);
      }
    } catch (e) {
      debugPrint('error is $e');
    }
    return products;
  }

}
