// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/historiques.dart';
import 'package:flutter_blue_app/pages/table_page.dart';
import 'package:flutter_blue_app/pages/vehicle_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Calucl_page.dart';

// ignore: must_be_immutable
class Slidepage extends StatefulWidget {
  String title;
  Slidepage({Key key, this.title}) : super(key: key);
  @override
  State<Slidepage> createState() => _SlidepageState();
}

class _SlidepageState extends State<Slidepage> {
  int activateIndex = 0;
  Widget buildindicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activateIndex,
      count: 2,
      effect: SlideEffect(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String _userId = FirebaseAuth.instance.currentUser.uid;
    return Scaffold(
        appBar: AppBar(
          title: Text("Data"),
          backgroundColor: Colors.red,
          actions: [
            IconButton(onPressed: ()async{
              var test = widget.title.split(RegExp(r"\s+|,\s+"));
              final _fireStore = FirebaseFirestore.instance.collection("Tyrematch_inspections").add({
                'Date&Time' : test[0],
                'Tyrematch kit identification' : test[1],
                'Menu element' : test[2],
                'S1A' : test[3],
                'S1B' : test[4],
                'S2A' : test[5],
                'S2B' : test[6],
                'Distance measurement type' : test[7],
                'DA' : test[8],
                'DB' : test[9],
                'Type of envinromental reading' : test[10],
                'Temperature' : test[11],
                'Atm Pressure' : test[12],
                'Air moisture' : test[13],
                "N°" : test[14],
                'Test #' : test[15],
                'date_creation' : DateTime.now(),
                'idUser' : _userId
              });
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>VehiclesPage(BL:"yes")));
            }, icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height *0.75,
              child: PageView(
                onPageChanged: ((value) {
                  setState(() {
                    activateIndex = value;
                  });
                }),
                children: [
                  Detailschart(
                    data: widget.title,
                  ),
                  Calculpage(data: widget.title)
                ],
              ),
            ),
            SizedBox(height: 20,),
            buildindicator()
          ],
        ));
  }
}
