import 'package:bigtoy/model/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/Provider/provider.dart';


final adminRepositoryProvider=Provider((ref) =>AdminRepository(firestore: ref.watch(firestoreprovider)));
class AdminRepository {
  final FirebaseFirestore _firestore;

  AdminRepository({required FirebaseFirestore firestore })
      :_firestore=firestore;

  CollectionReference get _admins => _firestore.collection("details");
  streamingData(){
    return _admins.snapshots().map((event) => event.docs.map((e) => CarModel.fromMap(e.data() as Map<String,dynamic>)).toList());
  }

  car(name,image,purchase,id,expanse,sold){
    CarModel carModel=CarModel( name: name, image: image,purchase: purchase, id: id,expanse: expanse,sold: sold);
    _admins.add(carModel.toMap()).then((value){
      value.update(carModel.copyWith(id: value.id).toMap());
    });

  }
  deletecar(String id){
    _admins.doc(id).delete();
  }
  update(CarModel carModel){
    _admins.doc(carModel.id).update(carModel.toMap());
  }
}