// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_print

import 'package:test_firebase/pages/homepage.dart';
// import 'package:test_firebase/pages/loginpage.dart';
// import 'package:test_firebase/pages/profilepage.dart';
// import 'package:app/widget/drawer.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:test_firebase/pages/otp.dart';
import 'package:test_firebase/pages/indianpackage.dart';
import 'package:test_firebase/pages/internationalpackage.dart';
import 'package:test_firebase/pages/loginpage.dart';
import 'package:test_firebase/pages/profilepage.dart';
import 'package:test_firebase/pages/reviews.dart';
// ignore: unused_import
import 'package:test_firebase/pages/trippage.dart';
import 'package:test_firebase/pages/schedulepage.dart';
import 'package:test_firebase/pages/details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:app/widget/drawer.dart';
// import 'dart:ui' show lerpDouble;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

Platform.isAndroid?
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCCM9IZg-nzr-G3DkPUCcfEKvJAnFy2NTg",
      appId: "1:3942565742:android:6db3ee8721ca00baa3237f",
      messagingSenderId: "3942565742",
      projectId: "test-firebase-ead11",
    ),
  )
  :await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      // home: const HomePage(),
      
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        // "/profile":(context) => const ProfilePage(),
        "/login": (context) =>   MyPhone(),
        // ignore: prefer_const_constructors
        "/home":(context) =>  HomePage(),
        "/schedule":(context) =>  Schedule(),
        // ignore: prefer_const_constructors
        "/indianpackages":(context) =>   IndianPackages(), 
        "/internationalpackages":(context) =>  InternationalPackages(),
        // ignore: equal_keys_in_map
        "/profile":(context) =>  ProfilePage(),
        "/details":(context)=>  Details(),
        "/otp":(context) =>  MyVerify( verificationid: ''),
        "/review":(context) => Reviews(),
        

      },
    );
  }
}