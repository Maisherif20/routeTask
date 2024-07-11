import 'package:route_task/domain_layer/entities/productResponse/Meta.dart';

class MetaDto {
  MetaDto({
      this.createdAt, 
      this.updatedAt, 
      this.barcode, 
      this.qrCode,});

  MetaDto.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['barcode'] = barcode;
    map['qrCode'] = qrCode;
    return map;
  }
  Meta toMeta(){
    return Meta(
      createdAt: createdAt,
      updatedAt: updatedAt,
      barcode: barcode,
      qrCode: qrCode
    );
  }


}