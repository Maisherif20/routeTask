import 'package:either_dart/either.dart';
import 'package:route_task/data_layer/model/ProductResponseDto.dart';
abstract class DataSourceContract{
  Future<Either<ProductResponseDto, String>> getProducts();
}