
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data_layer/dataSourceContract/dataSurceContract.dart';
import 'package:route_task/domain_layer/entities/productResponse/ProductResponse.dart';
import 'package:route_task/domain_layer/repository_Contract/repositoryContract.dart';
@Injectable(as: RepositoryContract)
class RepositoryImplementation extends RepositoryContract{
  DataSourceContract dataSourceContract;
  @factoryMethod
  RepositoryImplementation({required this.dataSourceContract});
  @override
  Future<Either<ProductResponse, String>> getProducts() async{
    var result = await dataSourceContract.getProducts();
    return result.fold((response) {
      return Left(response.toProductResponse());
    }, (error) {
      return Right(error);
    });
  }

}