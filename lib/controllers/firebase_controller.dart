import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  void fetchData() async {
    try {
      CollectionReference countryCollection =
          FirebaseFirestore.instance.collection('country');

      DocumentSnapshot countryDoc =
          await countryCollection.doc('gEVV7SnaeA946UQHIviF').get();

      if (countryDoc.exists) {
        Map<String, dynamic> countryData =
            countryDoc.data() as Map<String, dynamic>;

        String countryId = countryData['country id'];

        log('Country Name: $countryId');
      } else {
        log('Document does not exist');
      }
    } catch (e) {
      log('Error fetching data:$e');
    }
  }
}
