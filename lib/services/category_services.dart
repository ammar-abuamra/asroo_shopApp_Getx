import 'package:http/http.dart' as http;
import 'package:udemy_shop_app/models/category_model.dart';
import 'package:udemy_shop_app/models/product_models.dart';
import 'package:udemy_shop_app/utils/my_string.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}

class AllCategoryServices {
  static Future<List<ProductModels>> getALLCategory(String categoryName) async {
    var response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}