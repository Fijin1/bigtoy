import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/car_model.dart';
import '../repository/adding_repository.dart';



final AddproductControllerProvider= Provider((ref) => AddproductController(addproductRespository: ref.watch(AddproductRespositoryProvider)),);
final StramPorductCollection = StreamProvider.family((ref,String CategoryId ) => ref.watch(AddproductControllerProvider).ProductStreamc(),);
class AddproductController{
  final AddproductRespository _addproductRespository;
  AddproductController({required AddproductRespository addproductRespository}):_addproductRespository=addproductRespository;

  addProducts({required ProductModel detail, required String CategoryId}){
    return  _addproductRespository.addProduct( details: detail);
  }
  Stream<List<ProductModel>> ProductStreamc(){
    return  _addproductRespository.productStream();
  }
  deleteproduct(String id){
    _addproductRespository.deleteProduct(id);
  }
   updateproduct(ProductModel detail){
    return _addproductRespository.updateProduct1(detail);
   }
}