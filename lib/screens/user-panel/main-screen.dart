// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gadgetgallore/screens/user-panel/all-flash-sale-screen.dart';
import 'package:gadgetgallore/screens/user-panel/all-product-screen.dart';
import 'package:gadgetgallore/screens/user-panel/cart-screen.dart';
import 'package:get/get.dart';
import 'package:gadgetgallore/screens/user-panel/all-categories-screen.dart';
import 'package:gadgetgallore/utils/app-constant.dart';
import 'package:gadgetgallore/widgets/all-products-widget.dart';
import 'package:gadgetgallore/widgets/banner-widget.dart';
import 'package:gadgetgallore/widgets/categories-widget.dart';
import 'package:gadgetgallore/widgets/custom-drawer-widget.dart';
import 'package:gadgetgallore/widgets/flash-sale-widget.dart';
// import 'package:gadgetgallore/widgets/flash-sale-widget.dart';
import 'package:gadgetgallore/widgets/heading-widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppConstant.appScondaryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppConstant.appScondaryColor,
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => CartScreen()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90.0,
              ),
              // banner
              BannerWidget(),

              //Heading Categories
              HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "Optimizing Budget for High Quality",
                onTap: () => Get.to(() => AllCategoriesScreen()),
                buttonText: "See More >",
              ),
              CategoriesWidget(),

              // // Heading FlashSale
              // HeadingWidget(
              //   headingTitle: "Flash Sale",
              //   headingSubTitle: "Hurry up! Limited Offer, Only in Seconds!",
              //   onTap: () => Get.to(()=> AllFlashSaleProductScreen()),
              //   buttonText: "See More >",
              // ),
              // FlashSaleWidget(),

              // Heading Product
              HeadingWidget(
                headingTitle: "All Product",
                headingSubTitle: "Strategic Budgeting for Premium Quality",
                onTap: () => Get.to(() => AllProductScreen()),
                buttonText: "See More >",
              ),
              AllProductWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
