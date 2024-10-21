
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constant/color.dart';
import '../../../main.dart';
import '../../../model/car_model.dart';
import '../../adding/condroller/adding_condroller.dart';
import 'addproductstream.dart';

class AddproductPage extends ConsumerStatefulWidget {

  const AddproductPage({super.key,

  });

  @override
  ConsumerState createState() => _AddproductPageState();
}

class _AddproductPageState extends ConsumerState<AddproductPage> {
  List stats=['Sold','Soldout'];
  String?dropdownValue;

  addPage(){
    ref.watch(AddproductControllerProvider).addProducts(detail: ProductModel(
      Date: DateController.text,
      Carname: CarnameController.text,
      Model:ModelController.text,
      Purchasedamount:PurchasedamountController.text,
      Expanse:ExpanseController.text,
      Soldamount:SoldamountController.text,
      dropdownValue:dropdownValue.toString(),
      images: images,
      image: coverImage.toString(),
      uploadedTime: DateTime.now(),
      ProductId: "",), CategoryId: "");

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ProductStream(id: '',),), (route) => false,);
  }
  TextEditingController DateController =TextEditingController();
  TextEditingController CarnameController =TextEditingController();
  TextEditingController ModelController =TextEditingController();
  TextEditingController PurchasedamountController =TextEditingController();
  TextEditingController ExpanseController=TextEditingController();
  TextEditingController SoldamountController =TextEditingController();
  TextEditingController StatusControlller =TextEditingController();


  PlatformFile? pickFile;
  UploadTask? uploadTask;
  String? coverImage;
  String? coverImage1;
  bool value = false;
  bool value1 = false;
  List images = [];

  Future selectedCoverImage(String name) async {
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
        .ref('Banner/${DateTime.now().toString()}-$name')
        .putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));
    final snapshot = await uploadTask?.whenComplete(() {});
    coverImage = (await snapshot?.ref.getDownloadURL())!;
    setState(() {});
  }

  Future selectFileListImage(String name) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    pickFile = result.files.first;
    final fileBytes = result.files.first.bytes;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Loading......")));
    uploadFileToFireBase1(name, fileBytes);
    setState(() {});
  }

  Future uploadFileToFireBase1(String name, fileBytes) async {
    uploadTask = FirebaseStorage.instance
        .ref('collection/${DateTime.now().toString()}-$name')
        .putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));
    final snapshot = await uploadTask?.whenComplete(() {});
    coverImage1 = (await snapshot?.ref.getDownloadURL())!;
    images.add(coverImage1);
    setState(() {});
  }

  List Size = [];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: value == true
                  ? Container(
                height: h * 0.3,
                width: w * 0.11,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w * 0.02),
                    image: DecorationImage(
                        image: NetworkImage(coverImage.toString()),
                        fit: BoxFit.fill),
                    border: Border.all(
                        width: w * 0.0015, color: Colors.white)),
              )
                  : Container(
                height: h * 0.3,
                width: w * 0.11,
                child: Icon(
                  Icons.image,
                  size: w * 0.06,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w * 0.02),
                    border: Border.all(
                        width: w * 0.0015, color: Colors.black)),
              ),
            ),
            SizedBox(height: h * 0.03),
            GestureDetector(
              onTap: () {
                value=true;
                selectedCoverImage("bigtoy");
              },
              child: Container(
                height: h * 0.07,
                width: w * 0.12,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(w * 0.01)),
                child: Center(
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.red),
                    )),
              ),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            // GestureDetector(
            //   onTap: () {
            //     value1 =true;
            //     selectFileListImage("name");
            //   },
            //   child: Container(
            //     height: h * 0.07,
            //     width: w * 0.12,
            //     decoration: BoxDecoration(
            //
            //         borderRadius: BorderRadius.circular(w * 0.01)),
            //     child: Center(
            //         child: Text(
            //           "Add1",
            //           style: TextStyle(color: Colors.blue),
            //         )),
            //   ),
            // ),
            SizedBox(
              height: h * 0.02,
            ),
            value1 == true
                ? Container(
              height: h * 0.15,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: w * 0.02),
                    width: w * 0.08,
                    height: h * 0.02,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w* 0.02),
                        image: DecorationImage(
                            image: NetworkImage(images[index]), fit: BoxFit.fill),
                        border: Border.all(
                            width: w * 0.0015,
                            color: Colors.white)),
                    // child: Image.network( images[index], fit: BoxFit.cover),
                  );
                },
                itemCount: 1,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            )
                : SizedBox(),
            SizedBox(height: h * 0.04),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: w * 0.2,
                  child: TextFormField(
                    controller: DateController ,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Date",
                        labelStyle: TextStyle(
                            color: Colors.blue, height: h * 0.02),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.01),
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.01),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w* 0.01),
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
                SizedBox(height: h*0.045,),
                Container(
                  width: w * 0.2,
                  child: TextFormField(
                    controller: CarnameController ,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Carname",
                        labelStyle: TextStyle(
                            color: Colors.blue, height: h * 0.02),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.01),
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.01),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w* 0.01),
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
                SizedBox(height: h*0.045,),
                Container(
                  width: w * 0.2,
                  child: TextFormField(
                    controller: ModelController ,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Model",
                        labelStyle: TextStyle(
                            color: Colors.blue, height: h * 0.02),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.01),
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.01),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w* 0.01),
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
                SizedBox(height: h*0.045,),
                Container(
                  width: w * 0.2,
                  child: TextFormField(
                    controller: PurchasedamountController ,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Purchased amount",
                        labelStyle: TextStyle(
                            color: Colors.blue, height: h * 0.02),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.01),
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.01),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w* 0.01),
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
                SizedBox(height: h*0.045,),
                Container(
                  width: w * 0.2,

                  child: TextFormField(
                    controller: ExpanseController ,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Expanse",
                        labelStyle: TextStyle(
                            color: Colors.blue, height: h * 0.02),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.01),
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.01),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w* 0.01),
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
                SizedBox(height: h*0.045,),
                Container(
                  width: w * 0.2,
                  child: TextFormField(
                    controller: SoldamountController ,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Sold amount",
                        labelStyle: TextStyle(
                            color: Colors.blue, height: h * 0.02),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.01),
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w * 0.01),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w* 0.01),
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),



                // Container(
                //   width: w * 0.2,
                //   child: TextFormField(
                //     controller: prizeController,
                //     textInputAction: TextInputAction.next,
                //     keyboardType: TextInputType.text,
                //     decoration: InputDecoration(
                //         labelText: "Purchased Amount",
                //         labelStyle: TextStyle(
                //             color: Colors.red, height: h * 0.02),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(w * 0.01),
                //             borderSide: BorderSide(color: ColorConst.primarycolor)),
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(w * 0.01),
                //             borderSide: BorderSide(color: Colors.black)),
                //         focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(w * 0.01),
                //             borderSide: BorderSide(color:Colors.black))),
                //   ),
                // ),
                // Container(
                //   width: w * 0.2,
                //   child: TextFormField(
                //     controller: sizeController,
                //     textInputAction: TextInputAction.next,
                //     keyboardType: TextInputType.text,
                //     decoration: InputDecoration(
                //         labelText: "sold amount",
                //         labelStyle: TextStyle(
                //             color: Colors.black,
                //             height: h*0.02
                //         ),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(w*0.01),
                //             borderSide: BorderSide(
                //                 color: Colors.black
                //             )
                //         ),
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(w*0.01),
                //             borderSide: BorderSide(
                //                 color: Colors.white
                //             )
                //         ),
                //         focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(w*0.01),
                //             borderSide: BorderSide(
                //                 color: ColorConst.primarycolor
                //             )
                //         )
                //
                //     ),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     sizeController.text.isEmpty
                //         ? ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text("please enter your size")))
                //         : Size.add(sizeController.text.toUpperCase());
                //     sizeController.clear();
                //     setState(() {});
                //   },
                //   child: Container(
                //     width: w * 0.05,
                //     height: h * 0.06,
                //     child: Center(
                //         child: Text(
                //           "Add",
                //           style: TextStyle(color: ColorConst.primarycolor),
                //         )),
                //     decoration: BoxDecoration(
                //         color: Colors.black,
                //         borderRadius: BorderRadius.circular(w * 0.009)),
                //   ),
                // ),

              ],
            ),
            SizedBox(
              height: h * 0.04,
            ),

            SizedBox(height:h*0.03,),
            Container(
              margin: EdgeInsets.only(right: w*0.06),
              width: w * 0.3,
              child: DropdownButton(hint: Text('Status'),value: dropdownValue,items: stats.map((value){return DropdownMenuItem(child: Text(value),value: value,);}).toList(), onChanged: (value) {
                dropdownValue=value.toString();
                print("888888888888888(***********************************************");
                print(dropdownValue);
                setState(() {});
                },

              ),
              // child: TextFormField(
              //   controller: StatusControlller,
              //   textInputAction: TextInputAction.next,
              //   keyboardType: TextInputType.text,
              //   decoration: InputDecoration(
              //       labelText: "Status",
              //       labelStyle: TextStyle(
              //           color: Colors.red,
              //           height: h*0.02
              //       ),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(w*0.01),
              //           borderSide: BorderSide(
              //               color: Colors.black
              //           )
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(w*0.01),
              //           borderSide: BorderSide(
              //               color: Colors.black
              //           )
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(w*0.01),
              //           borderSide: BorderSide(
              //               color: Colors.black
              //           )
              //       )
              //
              //   ),
              // ),
            ),
            SizedBox(height:h*0.03,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductStream(id: ""),));
                addPage();
              },
              child: Container(
                height: h * 0.07,
                width: w * 0.12,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(w * 0.01)),
                child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(color:Colors.white),
                    )),
              ),
            ),


          ],
        ),
      ),
    );
  }
}