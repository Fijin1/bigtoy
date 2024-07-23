
import 'package:bigtoy/addcardetails.dart';
import 'package:bigtoy/constant/imageconst.dart';
import 'package:bigtoy/details.dart';
import 'package:bigtoy/login_page.dart';
import 'package:bigtoy/view_car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

TextEditingController name = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController email = TextEditingController();

class _HomePageState extends State<HomePage> {
  /// Views to display
  List<Widget> views = const [
    Details(),
    Add(),




  ];

  /// The currently selected index of the bar
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// You can use an AppBar if you want to
      // appBar: AppBar(
        backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: const Center(child: Text('BIG TOY')),
      // ),

      // The row is needed to display the current view
      body: Row(
        children: [
          /// Pretty similar to the BottomNavigationBar!
          SideNavigationBar(
            theme: SideNavigationBarTheme(
                itemTheme: SideNavigationBarItemTheme(
                    unselectedItemColor: Colors.black,
                    selectedItemColor: Colors.brown),
                togglerTheme: SideNavigationBarTogglerTheme(
                    expandIconColor: Colors.brown),
                dividerTheme: SideNavigationBarDividerTheme.standard()),
            selectedIndex: selectedIndex,

            footer: SideNavigationBarFooter(

                label: InkWell(
              onTap: () {
                showCupertinoModalPopup(context: context, builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text("Are you sure\nYou want to Exit"),
                    actions: [
                      Column(
                        children: [
                          CupertinoDialogAction(child: Text("yes",style: TextStyle(fontSize: w*0.01,fontWeight: FontWeight.w800,color: Colors.red),),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const CreatePage(),), (route) => false);
                            }, ),
                          const Divider(),
                          CupertinoDialogAction(child: Text("cancel",style: TextStyle(fontSize: w*0.01,fontWeight: FontWeight.w800),)
                            ,onPressed: () {
                              Navigator.pop(context);
                            },),

                        ],
                      )




                    ],
                  );
                },);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Exit",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.015),),
                  SizedBox(width: w*0.01,),
                  const Icon(Icons.exit_to_app)
                ],
              ),
            )),
            header: SideNavigationBarHeader(image: Image.asset(ImageConst.bigtoylogo,width: w*0.04,), title:  Text("BIG TOY",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.012,color: Colors.black),), subtitle: Padding(
              padding:  EdgeInsets.only(left:w*0.01),
              child: const Text("Used Cars",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),),
            )),
            items: const [

              SideNavigationBarItem(

                icon: Icons.details,
                label: 'View',


              ),
              // SideNavigationBarItem(
              //   icon: Icons.person,
              //   label: 'users',
              //
              // ),
              SideNavigationBarItem(
                icon: Icons.car_crash,
                label: 'Add Car Details',
              ),
              // SideNavigationBarItem(
              //   icon: Icons.import_export,
              //   label: 'Categories',
              // ),
              // SideNavigationBarItem(
              //   icon: Icons.production_quantity_limits,
              //   label: 'Items',
              // ),

            ],
            onTap: (index) {

              setState(() {
                selectedIndex = index;
              });
            },
          ),

          /// Make it take the rest of the available width
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}