import 'package:flutter/material.dart';

class Test1 extends StatefulWidget {
  Test1({
    Key key,
  }) : super(key: key);
  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
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
    List<DataRow> row() {
      List.generate(test.length, (index) {
        return <DataRow>[ DataRow(
          cells: <DataCell>[
            DataCell(Text('${test[index]}')),
          
          ],
        )];
      });
    }

    List<DataColumn> column() {
      List.generate(type.length, (index) {
        return <DataColumn>[ DataColumn(
          label: Text(
            '${type[index]}',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        )];
      });
    }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        body: DataTable(
         
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Date&Time',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Tyrematch kit identification',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Menu element',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'S1A',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'S1B',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'S2A',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'S2B',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Distance measurement type',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'DA',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'DB',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Type of envinromental reading',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Temperature',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Atm Pressure',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Air moisture',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'N°',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Test #',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows:  <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('${test[0]}')),
            DataCell(Text('${test[1]}')),
            DataCell(Text('${test[2]}')),
            DataCell(Text('${test[3]}')),
            DataCell(Text('${test[4]}')),
            DataCell(Text('${test[5]}')),
            DataCell(Text('${test[6]}')),
            DataCell(Text('${test[7]}')),
            DataCell(Text('${test[8]}')),
            DataCell(Text('${test[9]}')),
            DataCell(Text('${test[10]}')),
            DataCell(Text('${test[11]}')),
            DataCell(Text('${test[12]}')),
            DataCell(Text('${test[13]}')),
            DataCell(Text('${test[14]}')),
            DataCell(Text('${test[15]}')),
          ],
        ),
     
      ],
    ));
  }
}
