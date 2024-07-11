import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/presentation_layer/ui/products/ProductItemWidget.dart';
import 'package:route_task/presentation_layer/ui/products/productScreenViewModel.dart';
import '../../../DI/DI.dart';

class ProductScreenView extends StatefulWidget {
  const ProductScreenView({super.key});

  @override
  State<ProductScreenView> createState() => _ProductScreenViewState();
}

class _ProductScreenViewState extends State<ProductScreenView> {
  ProductViewModel productViewModel=getIt<ProductViewModel>() ;
  @override
  void initState() {
    productViewModel.getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: productViewModel,
        builder: (BuildContext context, state){
        return Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 10 / 10),
              itemBuilder: (context, index) {
                switch (state) {
                  case LoadingState():
                    {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  case ErrorState():
                    {
                      return Center(
                        child: Text(state.errorMessage),
                      );
                    }
                  case SuccessState():
                    {
                      return ProductItemWidget(product: state.productResponse.products![index],);
                    }
                }
                return null;
              },
              itemCount: state is SuccessState ? state.productResponse.products!.length : 0),
        );
        },

    );
  }
}
