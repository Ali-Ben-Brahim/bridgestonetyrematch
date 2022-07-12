import 'package:flutter/material.dart';

class Detailschart extends StatefulWidget {
  const Detailschart({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<Detailschart> createState() => DetailschartState();
}

class DetailschartState extends State<Detailschart> {
  List type = [
    'Date&Time',
    'Tyrematch kit identification',
    'Menu element',
    'S1A',
    'S1B',
    'S2A',
    'S2B',
    'Distance measurement type',
    'DA',
    'DB',
    'Type of envinromental reading',
    'Temperature',
    'Atm Pressure',
    'Air moisture',
    "N°",
    'Test #'
  ];

  DataRow fct(i, j) {
    return DataRow(cells: [
      DataCell(
        Text('$i'),
      ),
      DataCell(
        Text('$j'),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var test = widget.title.split(RegExp(r"\s+|,\s+"));
    double lead =
        ((double.parse(test[4])/ double.parse(test[6])) / (double.parse(test[3]) / double.parse(test[5])) - 1) *
            100;
    double interAxieRatio =
        (double.parse(test[3])/ double.parse(test[5])) ;
    double front =
        (double.parse(test[8])/ double.parse(test[3])) ;  
         double rear =
        (double.parse(test[8])/ double.parse(test[5])) ;   
    return Scaffold(
        appBar: AppBar(
          title: const Text("Table"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: <Widget>[
                    Text(
                      "Table",
                      textScaleFactor: 2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    DataTable(
                        columns: const [
                          DataColumn(
                            label: Text('Type'),
                          ),
                          DataColumn(
                            label: Text('Donnees'),
                          ),
                        ],
                        rows: List.generate(type.length,
                            (index) => fct(type[index], test[index]))),
                            SizedBox(height: 20,),
                            Text("Calcule",
                      textScaleFactor: 2,
                      style: TextStyle(fontWeight: FontWeight.bold),)
                                
                                
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                                  Text("lead: ${lead.toStringAsFixed(2)}",style: TextStyle(fontSize: 20),),
                                  Text("inter axie raio : ${interAxieRatio.toStringAsFixed(2)}",style: TextStyle(fontSize: 20)),
                                  Text("Rolling circumferences:",style: TextStyle(fontSize: 22)),
                                  Text("Front: ${front.toStringAsFixed(2)}",style: TextStyle(fontSize: 20)),
                                  Text("Rear: ${rear.toStringAsFixed(2)}",style: TextStyle(fontSize: 20))
                    ],),
                  )
            ],
          
          ),
        ));
  }
}
