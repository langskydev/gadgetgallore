// ignore_for_file: file_names, must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetgallore/models/product-model.dart';
import 'package:gadgetgallore/utils/app-constant.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductModel productModel;
  ProductDetailScreen({super.key, required this.productModel});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appScondaryColor,
        title: const Text("product Details"),
      ),
      body: Container(
        child: Column(children: [
          // produk images
          SizedBox(
            height: Get.height / 60,
          ),

          CarouselSlider(
            items: widget.productModel.productImages
                .map(
                  (imageUrls) => ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: imageUrls,
                      fit: BoxFit.cover,
                      width: Get.width - 10,
                      placeholder: (context, url) => const ColoredBox(
                        color: Colors.white,
                        child: Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              aspectRatio: 2.5,
              viewportFraction: 1,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.productModel.productName),
                            Icon(Icons.favorite_outline)
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Text("Rp. " + widget.productModel.fullPrice)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Text("CategoryName : " +
                            widget.productModel.categoryName)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Text("Deskripsi : " +
                            widget.productModel.productDescription)),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            child: Container(
                              width: Get.width / 3.0,
                              height: Get.height / 16,
                              decoration: BoxDecoration(
                                  color: AppConstant.appScondaryColor,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: TextButton(
                                child: Text(
                                  "Whatsapp",
                                  style: TextStyle(
                                      color: AppConstant.appTextColor),
                                ),
                                onPressed: () {
                                  // Get.to(() => SignIn());
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Material(
                            child: Container(
                              width: Get.width / 3.0,
                              height: Get.height / 16,
                              decoration: BoxDecoration(
                                  color: AppConstant.appScondaryColor,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: TextButton(
                                child: Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                      color: AppConstant.appTextColor),
                                ),
                                onPressed: () {
                                  // Get.to(() => SignIn());
                                },
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
