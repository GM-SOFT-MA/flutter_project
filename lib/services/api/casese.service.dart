import 'dart:convert';

import 'package:http/http.dart';
import 'package:project/models/cases.model.dart';

class ApiService {
  final String apiUrl = "http://192.168.0.7:3000/api";


  Future<List<Cases>> getCases() async {
    final url= Uri.parse("$apiUrl/produits");
    Response res = await get(url);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Cases> cases = body.map((dynamic item) => Cases.fromJson(item)).toList();
      return cases;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Cases> getCaseById(String id) async {
    final url= Uri.parse("$apiUrl/produits/$id");
    final response = await get(url);

    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<Cases> createCase(Cases cases) async {
    Map data = {
      'name': cases.name,
      'gender': cases.gender,
      'age': cases.age,
      'address': cases.address,
      'city': cases.city,
      'country': cases.country,
      'status': cases.status
    };
    final url= Uri.parse("$apiUrl/produits");
    final Response response = await post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<Cases> updateCases(String id, Cases cases) async {
    Map data = {
      'name': cases.name,
      'gender': cases.gender,
      'age': cases.age,
      'address': cases.address,
      'city': cases.city,
      'country': cases.country,
      'status': cases.status
    };
    final url= Uri.parse("$apiUrl/produits/$id");
    final Response response = await put(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  Future<void> deleteCase(String id) async {
    final url= Uri.parse("$apiUrl/produits/$id");
    Response res = await delete(url);
    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }

}