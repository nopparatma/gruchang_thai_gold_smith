import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/product.dart';
import 'fire_base_storage.dart';

class FireBaseFireStore {
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('product');

  Future<List<Product>> getAllData() async {
    try {
      List<Product> products = [];

      await _collectionReference.get().then((value) async {
        for (var result in value.docs) {
          products.add(
            Product(
              nameTH: result.get('name_th'),
              nameEN: result.get('name_en'),
              imgUrl: await FireBaseStorage().getImgUrl(result.get('image')),
            ),
          );
        }
      });

      return products;
    } catch (e) {
      debugPrint('ERROR => $e');
      return [];
    }
  }
}
