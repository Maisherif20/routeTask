import 'package:either_dart/either.dart';
import 'package:route_task/domain_layer/entities/productResponse/ProductResponse.dart';

abstract class RepositoryContract{
  Future<Either<ProductResponse,String>>getProducts();
}