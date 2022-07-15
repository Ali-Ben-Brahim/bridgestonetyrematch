import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const_variable.dart';

class Calculpage extends StatelessWidget {
  const Calculpage({Key key, this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
   
    var test = data.split(RegExp(r"\s+|,\s+"));
    double lead = ((double.parse(test[4]) / double.parse(test[6])) /
                (double.parse(test[3]) / double.parse(test[5])) -
            1) *
        100;
    double interAxieRatio = (double.parse(test[3]) / double.parse(test[5]));
    double front = (double.parse(test[8]) / double.parse(test[3]));
    double rear = (double.parse(test[8]) / double.parse(test[5]));
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
            "lead: ${lead.toStringAsFixed(virgule)}",
            style: GoogleFonts.lora(textStyle:styledata),
          ),
          Text("inter axie raio : ${interAxieRatio.toStringAsFixed(virgule)}",
              style: GoogleFonts.lora(textStyle:styledata)),
          Text("Rolling circumferences:", style: GoogleFonts.lora(textStyle:styledata),maxLines: 1,),
          Text("Front: ${front.toStringAsFixed(virgule)}", style: GoogleFonts.lora(textStyle:styledata)),
          Text("Rear: ${rear.toStringAsFixed(virgule)}", style: GoogleFonts.lora(textStyle:styledata))
        ],
      ),
    );
  }
}
