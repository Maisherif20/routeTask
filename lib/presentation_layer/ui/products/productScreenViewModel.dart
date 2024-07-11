import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/domain_layer/entities/productResponse/ProductResponse.dart';
import '../../../domain_layer/useCase/getProductsUseCase.dart';
@injectable
class ProductViewModel extends Cubit<ProductsState> {
  GetProductUseCase getProductUseCase;

  @factoryMethod
  ProductViewModel({required this.getProductUseCase}) : super(InitialState());
  void getProducts() async {
    emit(LoadingState());
    var result = await getProductUseCase.invoke();
    try {
      return result.fold((response) {
        emit(SuccessState(productResponse: response));
      }, (error) {
        emit(ErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class ProductsState {}

class InitialState extends ProductsState {}

class LoadingState extends ProductsState {}

class SuccessState extends ProductsState {
  ProductResponse productResponse;
  SuccessState({required this.productResponse});
}
class ErrorState extends ProductsState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
