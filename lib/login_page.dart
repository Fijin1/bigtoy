import 'package:bigtoy/constant/color.dart';
import 'package:bigtoy/constant/imageconst.dart';
import 'package:bigtoy/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final formKey=GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  final emailValidation=RegExp(r"bigtoy");
  final passwordValidation=RegExp(r'bigtoy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Row(


              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: h*1,
                      width: w*0.5,


                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Center(child: Image.asset(ImageConst.bigtoylogo,width: w*0.44,)
                            // ),
                            SizedBox(height: h*0.01,),
                            Text("Big Toy",
                              style: GoogleFonts.pacifico(textStyle: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                              )


                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.all(w * 0.01),
                  child: Container(
                    height: h * 0.6,
                    width: w * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      border: Border.all(color: Colors.brown,width: w*0.01),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.normal,
                          color: Colors.grey.withOpacity(0.15),
                          offset: Offset(0, 4),
                          spreadRadius: 15,
                          blurRadius: 15,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: w * 0.2,
                          height: w * 0.03,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colorconst.primarycolor),
                              borderRadius: BorderRadius.circular(w * 0.01),
                              color: Colors.white),
                          child: TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.newline,
                              validator: (value) {
                                if (!emailValidation.hasMatch(value!)) {
                                  return "enter valid username";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                label: Text(
                                  " enter username",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: w * 0.01),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(w * 0.1)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(w * 0.01),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(w * 0.01),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        Container(
                          width: w * 0.2,
                          height: w * 0.03,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colorconst.primarycolor),
                            borderRadius: BorderRadius.circular(w * 0.01),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                              controller: password,
                              keyboardType: TextInputType.text,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.newline,
                              validator: (value) {
                                if (!passwordValidation.hasMatch(value!)) {
                                  return "enter valid Password";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                label: Text(
                                  "password",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: w * 0.01),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(w * 0.1)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(w * 0.01)),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(w * 0.01),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(w * 0.01),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: w * 0.04,
                        ),
                        InkWell(
                          onTap: () {
                            if (email.text != "" &&
                                password.text != "" &&
                                formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ));
                            } else {
                              email.text == ""
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                      Text("please enter your username")))
                                  : password.text == ""
                                  ? ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                      "please enter password")))
                                  : ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text(
                                      "enter your valid details")));
                            }
                          },
                          child: Container(
                            width: w * 0.1,
                            height: w * 0.025,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w * 0.04),
                                color: Colors.grey),
                            child: const Center(
                                child: Text(
                                  "login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
