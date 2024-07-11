import 'package:route_task/domain_layer/entities/productResponse/ProductResponse.dart';
import 'ProductsDto.dart';
class ProductResponseDto {
  ProductResponseDto({
      this.productsDto,
      this.statusMsg,
      this.message,
      this.total,
      this.skip, 
      this.limit,});

  ProductResponseDto.fromJson(dynamic json) {
    if (json['products'] != null) {
      productsDto = [];
      json['products'].forEach((v) {
        productsDto?.add(ProductsDto.fromJson(v));
      });
    }
    total = json['total'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    skip = json['skip'];
    limit = json['limit'];
  }
  List<ProductsDto>? productsDto;
  num? total;
  String? statusMsg;
  String? message;
  num? skip;
  num? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (productsDto != null) {
      map['products'] = productsDto?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    return map;
  }
  ProductResponse toProductResponse(){
    return ProductResponse(
      products: productsDto?.map((product) => product.toProducts()).toList(),
      total: total,
      skip: skip,
      limit: limit,
      message: message,
      statusMsg: statusMsg
    );
  }

}