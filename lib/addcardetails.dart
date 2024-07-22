// class _addCardDetailes extends StatefulWidget< addCardDetailes> {

//   // addmen1(){
//   //   ref.watch(addControllerProvider).addBoy(
//   //       detail: DressModel(name: nameController.text,
//   //           prize: double.parse(priceController.text),
//   //           size: size1,
//   //           description: descriptionController.text,
//   //           image: CoverImage.toString(),
//   //           id: ""));
//   // }
//   // addSkip1(){
//   //   ref.watch(addControllerProvider).addSkips(
//   //       detail: DressModel(name: nameController.text,
//   //           prize: double.parse(priceController.text),
//   //           size: size1,
//   //           description: descriptionController.text,
//   //           image: CoverImage.toString(),
//   //           id: ""));
//   // }

//   @override
//   Widget build(BuildContext context) {
//
//   }

import 'package:bigtoy/model/car_model.dart';
import 'package:bigtoy/view_car.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'future/adding/condroller/adding_condroller.dart';
import 'future/adding/repository/adding_repository.dart';
import 'main.dart';

class Add extends ConsumerStatefulWidget {
  const Add({super.key});

  @override
  ConsumerState<Add> createState() => _AddState();
}

class _AddState extends ConsumerState<Add> {
  List size1 = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController purchaseController = TextEditingController();
  TextEditingController expanseController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController soldController = TextEditingController();

  PlatformFile? pickFile;
  UploadTask? uploadTask;
  String? CoverImage;
  bool value = false;


  Future selectFileToMessage(String name) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    pickFile = result.files.first;

    final fileBytes = result.files.first.bytes;

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Loading......")));
    uploadFileToFireBase(name, fileBytes);
    setState(() {});
  }

  Future uploadFileToFireBase(String name, fileBytes) async {
    uploadTask = FirebaseStorage.instance
        .ref('collection/${DateTime.now().toString()}-$name')
        .putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));
    final snapshot = await uploadTask?.whenComplete(() {});
    CoverImage = (await snapshot?.ref.getDownloadURL())!;
    print(CoverImage);
    print('qwertyuiop');
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  addingAdmin() {
    CarModel car = CarModel(
      name: nameController.text,
      image: CoverImage.toString(),
      purchase: purchaseController.text,
      expanse: expanseController.text,
      sold: soldController.text,
      id: "",
    );

    ref.watch(adminControllerProvider).admin(
        name: nameController.text,
        purchase: purchaseController.text,
        image: CoverImage.toString(),
        expanse: expanseController.text,
        sold: soldController.text,
        id: "");
  }

  deleteAdmin(String id) {
    ref.read(adminRepositoryProvider).deletecar(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            value == true
                ? Container(
                    height: h * 0.3,
                    width: w * 0.13,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: w * 0.002, color: Colors.blue),
                        image: DecorationImage(
                            image: NetworkImage(CoverImage.toString()),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(w * 0.02)))
                : Container(
                    height: h * 0.3,
                    width: w * 0.13,
                    child: Icon(
                      Icons.image,
                      size: w * 0.05,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: w * 0.002,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(w * 0.02)),
                  ),

            InkWell(
              onTap: () {
                value = true;
                selectFileToMessage("Car Name");
              },
              child: Container(
                child: Center(
                  child: Text(
                    "Add Photo",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
                height: h * 0.06,
                width: w * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w * 0.01),
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: h * 0.2,
              width: w * 0.7,
              //color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text("Car Name"),
                      constraints: BoxConstraints(
                          maxHeight: w * 0.04, maxWidth: w * 0.15),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: w * 0.002),
                          borderRadius: BorderRadius.circular(w * 0.01)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(w * 0.01)),
                    ),
                  ),
                  TextFormField(
                    controller: purchaseController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text("Purchased Amount"),
                      constraints: BoxConstraints(
                          maxHeight: w * 0.04, maxWidth: w * 0.15),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: w * 0.002),
                          borderRadius: BorderRadius.circular(w * 0.01)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(w * 0.01)),
                    ),
                  ),
                  TextFormField(
                    controller: expanseController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text("Expense"),
                      constraints: BoxConstraints(
                          maxHeight: w * 0.04, maxWidth: w * 0.15),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: w * 0.002),
                          borderRadius: BorderRadius.circular(w * 0.01)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(w * 0.01)),
                    ),
                  ),
                  TextFormField(
                    controller: soldController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text("Sold Amount"),
                      constraints: BoxConstraints(
                          maxHeight: w * 0.04, maxWidth: w * 0.15),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: w * 0.002),
                          borderRadius: BorderRadius.circular(w * 0.01)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(w * 0.01)),
                    ),
                  ),
                  //       GestureDetector(
                  //         onTap: () {
                  //           size1.add(sizeController.text.toUpperCase());
                  //           sizeController.clear();
                  //           setState(() {
                  //
                  //           });
                  //         },
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           width: w*0.08,
                  //           height: h*0.06,
                  //           child: Text("Add",style: TextStyle(
                  //               color: Colors.black
                  //           ),),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(w*0.01),
                  //             color: Colors.blue
                  //           ),
                  //         ),
                  //       )
                ],
              ),
            ),
            Container(
              height: h * 0.07,
              width: w * 0.4,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: w * 0.015),
                    width: w * 0.05,
                    height: h * 0.07,
                    child: Text(
                      size1[index],
                      style: TextStyle(color: Colors.blue),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w * 0.01),
                      color: Colors.yellow,
                    ),
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: size1.length,
              ),
            ),
            // Container(
            //   width: w*0.5,
            //   height: h*0.09,
            //   child: TextFormField (
            //     controller: descriptionController,
            //     keyboardType:TextInputType.multiline,
            //     textInputAction:TextInputAction.next,
            //     maxLines: 6,
            //     minLines: 2,
            //     decoration: InputDecoration(
            //       label:Text("Description"),
            //       constraints:BoxConstraints(
            //           maxHeight:w*0.04,
            //           maxWidth: w*0.15
            //       ),
            //       enabledBorder:OutlineInputBorder(
            //           borderSide: BorderSide(
            //               color:Colors.black,
            //               width:w*0.002
            //           ),
            //           borderRadius:BorderRadius.circular(w*0.01)
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(
            //               color:Colors.black
            //           ),
            //           borderRadius:BorderRadius.circular(w*0.01)
            //       ),
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     addmen1();
            //     addSkip1();
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => Boystream(),));
            //   },
            InkWell(
              onTap: () {
                addingAdmin();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewCar(),
                    ));
              },
              child: Container(
                height: h * 0.1,
                width: w * 0.13,
                child: Center(
                  child: Text(
                    "Add Item",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(w * 0.013)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
