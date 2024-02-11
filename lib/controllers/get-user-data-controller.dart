// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GetUserDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getUserData(String uId) async {
    final QuerySnapshot userData =
        await _firestore.collection('user').where('uId', isEqualTo: uId).get();
    return userData.docs;
  }
}
