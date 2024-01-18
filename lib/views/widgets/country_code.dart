// import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CountryController extends GetxController {
  final RxList<MapEntry<String, String>> countryEntries =
      <MapEntry<String, String>>[].obs;
  final RxString selectedCountryCode = ''.obs;

  void updateCountryEntries(List<MapEntry<String, String>> entries) {
    countryEntries.assignAll(entries);
  }

  void updateSelectedCountryCode(String countryCode) {
    selectedCountryCode.value = countryCode;
  }
}

class CountryDropdown extends StatelessWidget {
  final CountryController countryController = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: getFirestoreInstance()
          .collection('countrycode')
          .doc('mfpDDptybTuao1NQcJmS')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text("No data available"));
        }

        var countryData = snapshot.data!.data();
        if (countryData == null || countryData is! Map<String, dynamic>) {
          return const Center(child: Text("Invalid data format"));
        }

        var countryIdData = countryData['country_code'];
        if (countryIdData == null || countryIdData is! Map<String, dynamic>) {
          return const Center(child: Text("Invalid country code data format"));
        }

        List<MapEntry<String, String>> countryEntries =
            countryIdData.entries.map((entry) {
                  return MapEntry(entry.key, entry.value.toString());
                }).toList() ??
                [];

        if (countryEntries.isEmpty) {
          return const Center(
            child: Text("No country codes available"),
          );
        }

        countryController.updateCountryEntries(countryEntries);

        return Obx(() {
          return DropdownButton<MapEntry<String, String>>(
            hint: const Text("Select Country"),
            isExpanded: true,
            padding: const EdgeInsets.symmetric(horizontal: 23),
            icon: const Icon(Icons.keyboard_arrow_down_sharp),
            value: countryController.selectedCountryCode.isNotEmpty
                ? countryController.countryEntries.firstWhere(
                    (entry) =>
                        entry.value ==
                        countryController.selectedCountryCode.value,
                    orElse: () => countryController.countryEntries[0],
                  )
                : null,
            onChanged: (value) {
              countryController.updateSelectedCountryCode(value!.value);
              log('Selected Country: ${value.key}, Value: ${value.value}');
            },
            items: countryController.countryEntries
                .map((MapEntry<String, String> entry) {
              return DropdownMenuItem<MapEntry<String, String>>(
                value: entry,
                child: Text(' (${entry.value})${entry.key} '),
              );
            }).toList(),
          );
        });
      },
    );
  }
}

FirebaseFirestore getFirestoreInstance() {
  return FirebaseFirestore.instance;
}
