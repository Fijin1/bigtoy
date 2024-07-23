import 'package:bigtoy/constant/color.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: w*0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: h*0.06,
                  width: w*0.09,

                  decoration: BoxDecoration(
                      color: colorconst.primarycolor,
                    borderRadius: BorderRadius.circular(w*0.01)
                  ),
                  child: Center(child: Text("Date",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)),
                ),
                Container(
                  height: h*0.06,
                  width: w*0.09,
                  decoration: BoxDecoration(
                      color: colorconst.primarycolor,
                      borderRadius: BorderRadius.circular(w*0.01)
                  ),
                  child: Center(child: Text("Car Name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)),
                ),
                Container(
                  height: h*0.06,
                  width: w*0.09,
                  decoration: BoxDecoration(
                      color: colorconst.primarycolor,
                      borderRadius: BorderRadius.circular(w*0.01)
                  ),
                  child: Center(child: Text("Model",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)),
                ),
                Container(
                  height: h*0.06,
                  width: w*0.09,
                  decoration: BoxDecoration(
                      color: colorconst.primarycolor,
                      borderRadius: BorderRadius.circular(w*0.01)
                  ),
                  child: Center(child: Text("Purchase Amount",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)),
                ),
                Container(
                  height: h*0.06,
                  width: w*0.09,
                  decoration: BoxDecoration(
                      color: colorconst.primarycolor,
                      borderRadius: BorderRadius.circular(w*0.01)
                  ),
                  child: Center(child: Text("Expanse",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)),
                ),
                Container(
                  height: h*0.06,
                  width: w*0.09,
                  decoration: BoxDecoration(
                      color: colorconst.primarycolor,
                      borderRadius: BorderRadius.circular(w*0.01)
                  ),
                  child: Center(child: Text("Sold Amount",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)),
                ),
                Container(
                  height: h*0.06,
                  width: w*0.09,
                  decoration: BoxDecoration(
                      color: colorconst.primarycolor,
                      borderRadius: BorderRadius.circular(w*0.01)
                  ),
                  child: Center(child: Text("Profit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)),
                ), Container(
                  height: h*0.06,
                  width: w*0.09,
                  decoration: BoxDecoration(
                      color: colorconst.primarycolor,
                      borderRadius: BorderRadius.circular(w*0.01)
                  ),
                  child: Center(child: Text("Status",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)),
                ),

              ],
            ),
          ),
          Divider(color: Colors.grey,),
          SizedBox(height: h*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                height: h*0.06,
                width: w*0.09,
                color: Colors.white,
                child: Center(child: Text("12/07/2009")),
              ),
              Container(
                height: h*0.06,
                width: w*0.09,
                color: Colors.white,
                child: Center(child: Text("Alto")),
              ),
              Container(
                height: h*0.06,
                width: w*0.09,
                color: Colors.white,
                child: Center(child: Text("2018")),
              ),
              Container(
                height: h*0.06,
                width: w*0.09,
                color: Colors.white,
                child: Center(child: Text("2,00,000")),
              ),
              Container(
                height: h*0.06,
                width: w*0.09,
                color: Colors.white,
                child: Center(child: Text("20,000")),
              ),
              Container(
                height: h*0.06,
                width: w*0.09,
                color: Colors.white,
                child: Center(child: Text("3,00,000")),
              ), Container(
                height: h*0.06,
                width: w*0.09,
                color: Colors.white,
                child: Center(child: Text("80,000")),
              ),
              Container(
                height: h*0.06,
                width: w*0.09,
                color: Colors.white,
                child: Center(child: Text("Sold Out")),
              ),

            ],
          ),
          SizedBox(height: h*0.02,),

        ],
      ),
    );
  }
}
