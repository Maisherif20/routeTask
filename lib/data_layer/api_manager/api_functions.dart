import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:route_task/data_layer/model/ProductResponseDto.dart';
import 'package:http/http.dart' as http;
@singleton
@injectable
class ApiManager{
  static const baseUrl = "dummyjson.com";
  Future<ProductResponseDto> getProducts() async {
    var url = Uri.https(baseUrl, "/products");
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    ProductResponseDto productResponse = ProductResponseDto.fromJson(json);
    return productResponse;
  }
}