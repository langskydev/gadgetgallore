// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gadgetgallore/utils/app-constant.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appScondaryColor,
        title: Text('Cart Screen'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 20,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              color: AppConstant.appTextColor,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppConstant.appScondaryColor,
            
                  child: Text("G"),
                ),
                title: Text("latest generation laptops"),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("2200"),
                    SizedBox(width: Get.width / 20.0,),
                    CircleAvatar(
                      radius: 14.0,
                      backgroundColor: AppConstant.appScondaryColor,
                      child: Text('-'),
                    ),
                    SizedBox(width: Get.width / 20.0,),
                    CircleAvatar(
                      radius: 14.0,
                      backgroundColor: AppConstant.appScondaryColor,
                      child: Text('+'),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total :"),
            Text("Rp. 5.000.000", style: TextStyle(fontWeight: FontWeight.bold),),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: Container(
                  width: Get.width / 2.0,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                      color: AppConstant.appScondaryColor,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextButton(
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
