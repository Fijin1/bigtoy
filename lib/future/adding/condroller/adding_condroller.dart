import 'dart:convert';

import 'package:bigtoy/model/car_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/adding_repository.dart';


final adminControllerProvider=Provider((ref) => AdminController(adminRepository: ref.watch(adminRepositoryProvider)));
final streamadmin=StreamProvider((ref) => ref.watch(adminControllerProvider).streamAdminData());

class AdminController {
  final AdminRepository _adminRepository;

  AdminController({required AdminRepository adminRepository})
      :_adminRepository=adminRepository;

  Stream streamAdminData() {
    return _adminRepository.streamingData();
  }
  admin({required name, required image,required purchase,required id,required expanse,required sold}) {
    _adminRepository.car(name, image,purchase,id,expanse,sold);
  }
  deleteAdmin(String id){
    _adminRepository.deletecar(id);
  }
  adminUpdate(CarModel carModel){
    _adminRepository.update(carModel);
  }
}
