import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'future/adding/condroller/adding_condroller.dart';
import 'future/adding/repository/adding_repository.dart';
import 'main.dart';

class ViewCar extends ConsumerStatefulWidget {
  const ViewCar({super.key});

  @override
  ConsumerState<ViewCar> createState() => _ViewCarState();
}

class _ViewCarState extends ConsumerState<ViewCar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  children: [
   Center(
     child: Container(
       height: w*0.09,
       width: w*0.9,
       color: Colors.grey,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Container(
             height: w*0.07,
             width: w*0.12,
             color: Colors.white,
           ),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Car Name : Alto"),
               Text(" Car Model : 2018"),
             ],
           ),
           Container(
             height: w*0.03,
             width: w*0.03,
             color: Colors.white,
             child: Icon(CupertinoIcons.arrow_down_circle),
           ),

         ],
       ),
     ),
   )

  ],
),
    );
  }
}
