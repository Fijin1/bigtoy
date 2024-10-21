import 'package:bigtoy/details.dart';
import 'package:bigtoy/home_page.dart';
import 'package:bigtoy/future/login_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'main.dart';
import 'main.dart';
import 'main.dart';
import 'main.dart';

var w;
var h;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: const HomePage(),

      debugShowCheckedModeBanner: false,
    );
  }
}
