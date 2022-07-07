import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  Test({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var test = widget.title.split(RegExp(r"\s+|,\s+"));
    List type =['Date&Time','Tyrematch kit identification','Menu element','S1A','S1B','S2A','S2B','Distance measurement type','DA','DB','Type of envinromental reading','Temperature','Atm Pressure','Air moisture',"N°",'Test #'];
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
              children: List.generate(
                  test.length, (index) => Text("${type[index]} : ${test[index]}")))),
    );
  }
}
