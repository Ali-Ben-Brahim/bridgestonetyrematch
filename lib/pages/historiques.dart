import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/details_historique.dart';

class Historiques extends StatefulWidget {
  const Historiques({Key key}) : super(key: key);

  @override
  State<Historiques> createState() => _HistoriquesState();
}

class _HistoriquesState extends State<Historiques> {
  List _tyrematchInspections = [];
  List _tyrematchInspectionsId = [];
  var userCredential = FirebaseAuth.instance.currentUser;

  getData() async {
    try {
      FirebaseFirestore.instance
          .collection('Tyrematch_inspections').orderBy('date_creation')
          .snapshots()
          .listen((event) {
        _tyrematchInspections = [];
        _tyrematchInspectionsId = [];
        event.docs.forEach((element) {
          if (element.data()['idUser'] == userCredential.uid) {
            setState(() {
              _tyrematchInspections.add(element.data());
              _tyrematchInspectionsId.add(element.id);
            });
          }
        });
      });
    } catch (_) {}
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
      ),
      body: _tyrematchInspections.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _tyrematchInspections.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailsHistorique(
                              id: _tyrematchInspectionsId[index],
                            )));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text('Date'),
                      subtitle:
                          Text("${_tyrematchInspections[index]['Date&Time']}"),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
