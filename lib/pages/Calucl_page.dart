import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../const_variable.dart';

class Calculpage extends StatefulWidget {
  final String data;
  const Calculpage({Key key, this.data}) : super(key: key);

  @override
  State<Calculpage> createState() => _CalculpageState();
}

class _CalculpageState extends State<Calculpage> {
  final String _userId = FirebaseAuth.instance.currentUser.uid;
  List _roleList=[];
  String _role='';
  CollectionReference _roleCollection = FirebaseFirestore.instance.collection("users");
  getRole()async{
    try{
      var responsebody= await _roleCollection.doc(_userId).get();
      setState(() {
        _roleList.add(responsebody.data());
        _role=_roleList.isEmpty?'':_roleList[0]['role'].toString();
      });
    }catch(_){}
  }
  @override
  void initState() {
  super.initState();
  getRole();
  }


  @override
  Widget build(BuildContext context) {
    var test = widget.data.split(RegExp(r"\s+|,\s+"));
    double lead = ((double.parse(test[4]) / double.parse(test[6])) /
                (double.parse(test[3]) / double.parse(test[5])) -
            1) *
        100;
    double interAxieRatio = (double.parse(test[3]) / double.parse(test[5]));
    double front = (double.parse(test[8]) / double.parse(test[3]));
    double rear = (double.parse(test[8]) / double.parse(test[5]));
    double slip = 1 -
        ((double.parse(test[8]) /
                (double.parse(test[3]) + double.parse(test[5])) /
                2) /
            (double.parse(test[9]) /
                (double.parse(test[4]) + double.parse(test[6])) /
                2));
    double axleDifference = (double.parse(test[3]) - (double.parse(test[5])));
    double axleRatio = (double.parse(test[3]) / (double.parse(test[5])));
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            "Calculation",
            style: GoogleFonts.ibarraRealNova(textStyle: styletitle),
          )),
          Text(
            "Lead: ${lead.toStringAsFixed(virgule)}",
            style: GoogleFonts.lora(textStyle: styledata),
          ),
          Text("Inter axie raio : ${interAxieRatio.toStringAsFixed(virgule)}",
              style: GoogleFonts.lora(textStyle: styledata)),
          _role==''?Container():
          _role =='basic'?Container():
          _role !='standard'?Container(): Text(
            "Rolling circumferences:",
            style: GoogleFonts.lora(textStyle: styledata),
            maxLines: 1,
          ),
          _role==''?Container():
          _role =='basic'?Container():
          _role !='standard'?Container():Text("Front: ${front.toStringAsFixed(virgule)}",
              style: GoogleFonts.lora(textStyle: styledata)),
          _role==''?Container():
          _role =='basic'?Container():
          _role !='standard'?Container():Text("Rear: ${rear.toStringAsFixed(virgule)}",
              style: GoogleFonts.lora(textStyle: styledata)),
          _role==''?Container():
          _role =='basic'?Container():
          _role !='standard'?Container():Text("%Slip: ${slip.toStringAsFixed(2)}",
              style: GoogleFonts.lora(textStyle: styledata)),
          _role==''?Container():
          _role =='basic'?Container():
          _role !='standard'?Container():Text("Axle Difference: ${axleDifference.toStringAsFixed(2)}",
              style: GoogleFonts.lora(textStyle: styledata)),
          _role==''?Container():
          _role =='basic'?Container():
          _role !='standard'?Container():Text("Axle Ratio: ${axleRatio.toStringAsFixed(2)}",
              style: GoogleFonts.lora(textStyle: styledata)),
          ElevatedButton(onPressed: ()async{
            try{
              
              if(_role =='basic'){
                var resp =await http.post(
                  Uri.parse("http://10.0.2.2:90/bridgestonetyrematch/fichier.php"),
                  body: {
                    'role':_role,
                    'lead' :lead.toStringAsFixed(virgule),
                    'interAxieRatio':interAxieRatio.toStringAsFixed(virgule),
                  },
                );
              }
              if(_role =='standard'){
                var resp =await http.post(
                  Uri.parse("http://10.0.2.2:90/bridgestonetyrematch/fichier.php"),
                  body: {
                    'role': _role,
                    'lead' : lead.toStringAsFixed(virgule),
                    'interAxieRatio' : interAxieRatio.toStringAsFixed(virgule),
                    'front' : front.toStringAsFixed(virgule),
                    'rear' : rear.toStringAsFixed(virgule),
                    'slip' : slip.toStringAsFixed(2),
                    'axleDifference' : axleDifference.toStringAsFixed(2),
                    'axleRatio' : axleRatio.toStringAsFixed(2),
                  },
                );
              }
            }catch(_){
            }
          }, child: SizedBox(
            width: double.infinity,
            child: Text("save"),))
        ],
      ),
    );
  }
}