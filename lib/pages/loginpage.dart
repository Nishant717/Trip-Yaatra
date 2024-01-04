// ignore_for_file: unnecessary_string_interpolations, avoid_print, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase/pages/otp.dart';
import 'package:firebase_core/firebase_core.dart';

class MyPhone extends StatefulWidget {
  MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(2, 1),
            colors: <Color>[
              Color.fromARGB(255, 84, 138, 183),
              Color.fromARGB(255, 255, 255, 255),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        // margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/tripyatra.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Phone Verification",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "We need to register your phone without getting started!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   // width: 40,
                      //   child: TextField(
                      //     controller: phonenumber,
                      //     keyboardType: TextInputType.number,
                      //     // decoration: InputDecoration(
                      //     //   border: InputBorder.none,
                      //     // ),
                      //   ),
                      // ),
                      Expanded(
                          child: TextField(
                        controller: phonenumber,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                        ),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // ignore: deprecated_member_use
                          primary: Colors.green.shade600,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: phonenumber.text.toString(),
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {
                              // Handle errors here (e.g., print error message or display error dialog)
                              print("Verification failed: ${e.message}");
                            },
                            codeSent:
                                (String verificationid, int? resendToken) {
                              Navigator.pushNamed(context, '/otp',
                                  arguments:
                                      verificationid); // Pass verificationId to OTP screen
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationid) {},
                          );
                        } catch (error) {
                          // Handle general errors here
                          print("Error sending OTP: $error");
                        }
                      },
                      child: const Text("Send the code")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
