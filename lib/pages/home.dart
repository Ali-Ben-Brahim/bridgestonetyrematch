// ignore_for_file: unused_local_variable

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
  void initState() {
    List type =['Tyrematch kit identification','Menu element','S1A','S1B','S2A','S2B','Distance measurement type','DA','DB','Type of envinromental reading','Temperature','Atm Pressure','Air moisture','Test #'];
    print(FirebaseAuth.instance.currentUser);
    super.initState();
  }

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
      body: const Center(child: Text('Home')),
    );
  }
}
