import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SearchVehicle extends StatefulWidget {
  const SearchVehicle({Key key}) : super(key: key);

  @override
  State<SearchVehicle> createState() => _SearchVehicleState();
}

class _SearchVehicleState extends State<SearchVehicle> {
  List _vehicles = [];
  List _vehiclesId = [];
  var userCredential = FirebaseAuth.instance.currentUser;

  getData() async {
    try {
      FirebaseFirestore.instance.collection("Vehicles").snapshots().listen((event) {
        _vehicles = [];
        _vehiclesId = [];
        event.docs.forEach((element) {
          if (element.data()['user_id'] == userCredential.uid) {
            setState(() {
              _vehicles.add(element.data());
              _vehiclesId.add(element.id);
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
      body: _vehicles.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _vehicles.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    
                  },
                  child: Card(
                    child: ListTile(
                      title: Text("${_vehicles[index]['registration_number']}"),
                      subtitle:
                          Text("${_vehicles[index]['vehicle_model_id']}"),
                    ),
                  ),
                );
              },
            ),
    );
  }
}