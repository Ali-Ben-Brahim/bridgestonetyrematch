// ignore_for_file: unused_local_variable

import 'package:flutter_blue_app/MainPage.dart';

import '/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => Login()));
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        //body: const Center(child: Text('Home')),
        body: Center(
            child: SizedBox(
                height: 80, //height of button
                width: 300, //width of button
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(
                          255, 235, 47, 47), //background color of button
                      side: BorderSide(
                          width: 3,
                          color: Colors.redAccent), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.all(20) //content padding inside button
                      ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => MainPage()));
                    //code to execute when this button is pressed.
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 23),
                  ),
                ))));
  }
}
