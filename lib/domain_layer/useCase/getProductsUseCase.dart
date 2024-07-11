import 'package:injectable/injectable.dart';
import 'package:route_task/domain_layer/entities/productResponse/ProductResponse.dart';
import 'package:route_task/domain_layer/repository_Contract/repositoryContract.dart';
import 'package:either_dart/either.dart';
@injectable
class GetProductUseCase{
  RepositoryContract repositoryContract;
  @factoryMethod
  GetProductUseCase({required this.repositoryContract});
  Future<Either<ProductResponse , String>>invoke(){
    return repositoryContract.getProducts();
  }
}