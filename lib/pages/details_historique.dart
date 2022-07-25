// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailsHistorique extends StatefulWidget {
  var id;
  DetailsHistorique({this.id, Key key}) : super(key: key);

  @override
  State<DetailsHistorique> createState() => _DetailsHistoriqueState();
}

class _DetailsHistoriqueState extends State<DetailsHistorique> {
  List _tyrematchInspections = [];

  CollectionReference tyrematchInspectionsCollectionReference =
      FirebaseFirestore.instance.collection('Tyrematch_inspections');

  getData() async {
    try {
      var responsebody =
          await tyrematchInspectionsCollectionReference.doc(widget.id).get();
      setState(() {
        _tyrematchInspections.add(responsebody.data());
     //   _tyrematchInspections.removeAt(11);
      });
    } catch (_) {}
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<DataRow> getDataRow(element) {
    List<DataRow> _list = [];
    element.forEach((value, i) {
      _list.add(DataRow(cells: [
        DataCell(
          Text('${value.toString()}'),
        ),
        DataCell(
          Text('${i.toString()}'),
        )
      ]));
    });
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        _tyrematchInspections.isEmpty
            ? Text("...Loading")
            : DataTable(columns: const [
                DataColumn(
                  label: Text('Type'),
                ),
                DataColumn(
                  label: Text('Donnees'),
                ),
              ], rows: getDataRow(_tyrematchInspections[0])),
      ]),
    );
  }
}
