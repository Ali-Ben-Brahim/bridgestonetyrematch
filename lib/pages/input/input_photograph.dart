// ignore_for_file: unused_local_variable, deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/vehicle_page.dart';
import 'package:image_picker/image_picker.dart';

class InputPhotographs extends StatefulWidget {
  var BL;
  var tyreId;
  var inspectionId;
  var inputVehicle;
  var inputTyre;
  var inputInspection;
  var inputTyreInspection;
  InputPhotographs({Key key, this.BL, this.tyreId, this.inspectionId, this.inputVehicle, this.inputTyre, this.inputInspection, this.inputTyreInspection}) : super(key: key);

  @override
  State<InputPhotographs> createState() => _InputPhotographsState();
}

class _InputPhotographsState extends State<InputPhotographs> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("input photograph"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                imageProfile(),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                              side: const BorderSide(
                                  width: 1, color: Colors.black))),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      fixedSize: MaterialStateProperty.all(const Size(349, 48)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 16))),
                  onPressed: () async{
                      print("InputTyre : ${widget.inputTyre}");
                      print("InputTyreInspection : ${widget.inputTyreInspection}");
                    if (_formKey.currentState.validate()) {
                      await FirebaseFirestore.instance.collection("Photographs").add({
                        "inspection_id" : widget.inspectionId,
                        "tyre_id": widget.tyreId,
                      });
                      await FirebaseFirestore.instance.collection("Inspections").add(widget.inputInspection);
                      await FirebaseFirestore.instance.collection("Tyrematch_inspections").add(widget.inputInspection);
                      await FirebaseFirestore.instance.collection("Tyres").add(widget.inputTyre);
                      await FirebaseFirestore.instance.collection("Vehicles").add(widget.inputVehicle);
                      if(widget.BL=='no'){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>VehiclesPage()));
                      }
                      if(widget.BL=='yes'){

                      }
                    }
                  },
                  child: const Text(
                    "Send",
                    style: TextStyle(color: Color.fromRGBO(75, 174, 79, 1)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("assets/images/camera.png")
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ElevatedButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
