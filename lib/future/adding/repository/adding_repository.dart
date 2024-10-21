import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/provider/provider.dart';
import '../../../model/car_model.dart';
import '../../Product/screen/addproductstream.dart';

final AddproductRespositoryProvider=Provider((ref) => AddproductRespository(firestore: ref.watch(firebaseProvider)));

class AddproductRespository{
  final FirebaseFirestore _firestore;
  AddproductRespository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _category => _firestore.collection("category");

  addProduct({ required ProductModel details}) async {
    return _category.add(details.toJson())
        .then((value) => value.update(details.copyWith(ProductId: value.id).toJson()));

  }
  Stream<List<ProductModel>>productStream(){
    return _category.snapshots().map((event) =>
        event.docs.map((e) => ProductModel.fromJson(e.data() as Map<String ,dynamic>) ,).toList(),);
  }
  deleteProduct(String id){
    _category.doc(id).delete();
  }
  updateProduct1(ProductModel detail){
    _category.doc(detail.ProductId).update(detail.toJson());
  }


}