import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/presentation_layer/ui/products/productsScreenView.dart';
import 'package:route_task/presentation_layer/ui/searchWidget/searchWidget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/img_1.png",width: 100.w,height: 40.h,),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchWidget(),
            SizedBox(height: 20.h,),
            ProductScreenView()
          ],
        ),
      ),
    );
  }
}
