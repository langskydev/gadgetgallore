// ignore_for_file: camel_case_types, unnecessary_overrides, unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class bannerController extends GetxController {
  RxList<String> bannerUrls = RxList<String>([]);

  @override
  void onInit() {
    super.onInit();
    fetchBannersUrls();
  }

  // fetch banner
  Future<void> fetchBannersUrls() async {
    try {
      QuerySnapshot bannersSnapshot =
          await FirebaseFirestore.instance.collection('spanduk').get();

      if (bannersSnapshot.docs.isNotEmpty) {
        bannerUrls.value = bannersSnapshot.docs
            .map((doc) => doc['imageUrl'] as String)
            .toList();
      }
    } catch (e) {
      print("error $e");
    }
  }
}
