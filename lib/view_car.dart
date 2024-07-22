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
  deleteAdmin(String id) {
    ref.read(adminRepositoryProvider).deletecar(id);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  children: [
    Expanded(
        child: ref.watch(streamadmin).when(
          data: (data) {
            // print("---------------------------");
            // print(data);
            return GridView.builder(
              itemCount: data.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: w * 0.1,
                mainAxisSpacing: w * 0.02,
                crossAxisSpacing: w * 0.02,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: w * 0.04,
                  width: w * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(w * 0.04),
                    gradient: LinearGradient(colors: [
                      Colors.grey,
                      Colors.greenAccent
                    ]),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(w * 0.01),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: w * 0.04,
                          backgroundColor: Colors.white,
                          backgroundImage:
                          NetworkImage(data[index].image),
                        ),
                        SizedBox(
                          width: w * 0.03,
                        ),
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              data[index].name,
                            ),
                            Text(data[index].purchase),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                            title: const Center(
                                                child: Text(
                                                    "view full details")),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(w *
                                                    0.03)),
                                            content: SizedBox(
                                              height: w * 0.4,
                                              width: w * 0.5,
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                    radius:
                                                    w * 0.06,
                                                    backgroundColor:
                                                    Colors
                                                        .white,
                                                    backgroundImage:
                                                    NetworkImage(
                                                        data[index]
                                                            .image),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                    h * 0.04,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        "Name : ${data[index].name}",
                                                        style:
                                                        TextStyle(
                                                          fontSize:
                                                          w * 0.02,
                                                          fontWeight:
                                                          FontWeight
                                                              .w800,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: h *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "purchase : ${data[index].purchase}",
                                                        style: TextStyle(
                                                            fontSize: w *
                                                                0.02,
                                                            fontWeight:
                                                            FontWeight.w800),
                                                      ),
                                                      SizedBox(
                                                        height: h *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "expanse : ${data[index].expanse}",
                                                        style: TextStyle(
                                                            fontSize: w *
                                                                0.02,
                                                            fontWeight:
                                                            FontWeight.w800),
                                                      ),
                                                      SizedBox(
                                                        height: h *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "sold : ${data[index].sold}",
                                                        style: TextStyle(
                                                            fontSize: w *
                                                                0.02,
                                                            fontWeight:
                                                            FontWeight.w800),
                                                      ),
                                                      SizedBox(
                                                        height: h *
                                                            0.03,
                                                      ),
                                                      Text(
                                                        "id : ${data[index].id}",
                                                        style: TextStyle(
                                                            fontSize: w *
                                                                0.02,
                                                            fontWeight:
                                                            FontWeight.w800),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ));
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: h * 0.05,
                                    width: w * 0.08,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                          w * 0.04),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                        child: Text(
                                          "View",
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight.w800),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: w * 0.02,
                                ),

                              ],
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: const Text(
                                      "Are you sure\nYou want to delete"),
                                  actions: [
                                    Column(
                                      children: [
                                        CupertinoDialogAction(
                                          child: Text(
                                            "yes",
                                            style: TextStyle(
                                                fontSize: w * 0.01,
                                                fontWeight:
                                                FontWeight.w800,
                                                color: Colors.red),
                                          ),
                                          onPressed: () {
                                            deleteAdmin(
                                                data[index].id);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        const Divider(),
                                        CupertinoDialogAction(
                                          child: Text(
                                            "cancel",
                                            style: TextStyle(
                                                fontSize: w * 0.01,
                                                fontWeight:
                                                FontWeight
                                                    .w800),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding:
                            EdgeInsets.only(left: w * 0.02),
                            child: const Icon(Icons.delete),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Column(
            children: [
              Text(error.toString()),
              Text('==============================='),
              Text(stackTrace.toString()),
            ],
          ),
          loading: () => Center(child: CircularProgressIndicator()),
        )),

  ],
),
    );
  }
}
