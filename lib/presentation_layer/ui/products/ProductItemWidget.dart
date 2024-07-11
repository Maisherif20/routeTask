import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/domain_layer/entities/productResponse/Products.dart';

class ProductItemWidget extends StatefulWidget {
  Products product;

  ProductItemWidget({required this.product});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  bool isDiscount = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.8, -0.8),
      children: [
        Container(
          height: 270.h,
          width: 191.w,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color.fromRGBO(0, 65, 130, 0.3))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: CachedNetworkImage(
                  imageBuilder: (context, imagePrvider) => Container(
                    width: 191.w,
                    height: 130.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: imagePrvider)),
                  ),
                  imageUrl: widget.product.images![0],
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(
                widget.product.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Container(
                  constraints: BoxConstraints(
                    maxWidth: 191.w,
                  ),
                  child: Text(
                    widget.product.description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
              Row(
                children: [
                  const Text("EGP "),
                  Text(widget.product.discountPercentage == null
                      ? widget.product.price.toString()
                      : widget.product.discountPercentage.toString()),
                  SizedBox(
                    width: 15.w,
                  ),
                  Visibility(
                      visible: widget.product.discountPercentage != null,
                      child: Text(widget.product.price.toString(),
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Color.fromRGBO(0, 65, 130, 0.6)))),
                ],
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Review ${widget.product.rating.toString()}",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    Spacer(),
                    Image.asset(
                      "assets/images/img_3.png",
                      height: 50.h,
                      width: 50.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset(
            "assets/images/img_2.png",
            width: 30.w,
            height: 30.h,
          ),
        ),
      ],
    );
  }
}
