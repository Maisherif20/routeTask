import 'Products.dart';

class ProductResponse {
  ProductResponse({
      this.products, 
      this.total, 
      this.message,
      this.statusMsg,
      this.skip,
      this.limit,});

  ProductResponse.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
    statusMsg = json['statusMsg'];
    message = json['message'];
  }
  List<Products>? products;
  num? total;
  num? skip;
  num? limit;
  String? statusMsg;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    return map;
  }

}