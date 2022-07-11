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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Table"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        columns: const [
                          DataColumn(
                            label: Text('Type'),
                          ),
                          DataColumn(
                            label: Text('Donnees'),
                          ),
                        ],
                        rows: List.generate(type.length,
                            (index) => fct(type[index], test[index]))))
              ]),
        ));
  }
}
