import 'package:project/models/product.model.dart';
import 'package:project/services/base.service.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


const baseUrl=  "http://127.0.0.1:8000/api/v1";
const headers=<String, String>{
  'Content-Type': 'application/json; charset=UTF-8',
};

class ProductService extends BaseService {

  Future<List> getAll() async {
    var url= Uri.parse("$baseUrl/produits");
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }


  Future<List<Product>> getAllObjects() async {
    var url= Uri.parse("$baseUrl/produits");
    http.Response response = await http.get(url);
    var resp= json.decode(response.body);

    if (resp.statusCode == 200) {
    //  return   ProductBean.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to load Product');
    }
  }
  ///////////////////////////////////GET All PRODUCT
  static Future getProducts() {
    var url = baseUrl + "/produits";
    return http.get(Uri.parse(url));
  }
  ////////////////////////////////get product by Id
  Future<String> fetchProduct() async {
    var url = baseUrl + "/produits/3";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;//ProductBean.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to load Product');
    }
  }

  Future<Product> create(Product obj) async {
    var url= Uri.parse("$baseUrl/produits");

    Map data={
      'name': obj.name,
      'price': obj.price,
      'quantity': obj.quantity,
      'components': obj.components,
    };

    final Response response = await http.post(  url,
      headers: headers,
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }
  // ghalat fa type hana ta3 price
  Future update(Product obj) async {
    try{
      var url= Uri.parse("$baseUrl/produits/"+obj.id.toString());
      Map data={
        'id': obj.id,
        'name': obj.name,
        'price': obj.price,
        'quantity': obj.quantity,
        'components': obj.components,
      };

      final response = await http.put(url,   headers: headers,  body: jsonEncode(data));

      if(response.statusCode==200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return e.toString();
    }

  }
  ///////////////////////////////////DELETE PRODUCT BY ID
  Future deletePage(String id) async {

    try{
      var url = baseUrl + "/produits";
      final response = await http.put(Uri.parse('$url/$id'));
      if(response.statusCode==200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return e.toString();
    }

  }
}
