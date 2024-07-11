import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data_layer/api_manager/api_functions.dart';
import 'package:route_task/data_layer/model/ProductResponseDto.dart';
import '../dataSourceContract/dataSurceContract.dart';
@Injectable(as: DataSourceContract)
class DataSourceImplementation extends DataSourceContract{
  ApiManager apiManager;
  @factoryMethod
  DataSourceImplementation({required this.apiManager});
  @override
  Future<Either<ProductResponseDto, String>> getProducts() async{
    try {
      var response = await apiManager.getProducts();
      if (response.statusMsg != null) {
        return Right(response.message!  ?? "Error in data source impl");
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

}