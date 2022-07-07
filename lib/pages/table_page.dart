import 'package:flutter/material.dart';

class Detailschart extends StatefulWidget {
  const Detailschart({Key key}) : super(key: key);

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
  List test = [
    '14:39:57.381 ',
    '\$B2K22FC-70',
    '&1',
    '33119',
    '30880',
    '24805',
    '22917',
    'A',
    '0',
    '0',
    'INT',
    '2500',
    '101259',
    '32',
    "123",
    '3#'
  ];

  DataRow fct(i, j) {
    return DataRow(
      cells:[
      DataCell(Text('$i'),),
      DataCell(Text('$j'),)
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Table"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment :MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Table",
                textScaleFactor: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DataTable(
                  columns: const[
                     DataColumn(
                      label: Text('Type'),
                    ),
                    DataColumn(
                      label: Text('Donnees'),
                    ),
                  ],
                rows: List.generate(type.length, (index) => fct(type[index],test[index]))
                )
              )
          ]),
      )
      );

  }
}