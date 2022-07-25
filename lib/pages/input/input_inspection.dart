// ignore_for_file: unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/formulaires/input_tyre_inspection.dart';

class InputInspection extends StatefulWidget {
  var BL;
  var tyreId;
  var vehicleId;
  var inputVehicle;
  var inputTyre;
  InputInspection({Key key, this.vehicleId, this.tyreId, this.BL, this.inputVehicle, this.inputTyre}) : super(key: key);

  @override
  State<InputInspection> createState() => _InputInspectionState();
}

class _InputInspectionState extends State<InputInspection> {

  final TextEditingController _inspectionIdController = TextEditingController();
  final TextEditingController _inspectionHController = TextEditingController();
  final TextEditingController _inspectionKmController = TextEditingController();
  final TextEditingController _inspectionDateController = TextEditingController();
  final TextEditingController _axle1WeightController = TextEditingController();
  final TextEditingController _axle2WeightController = TextEditingController();
  final TextEditingController _axle3WeightController = TextEditingController();
  final TextEditingController _balastTypeAndPositionController = TextEditingController();
  final TextEditingController _implementController = TextEditingController();
  final String _userId = FirebaseAuth.instance.currentUser.uid;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("input inspection"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20 ,15 ,20 , 0),
        child: SingleChildScrollView(
          child: Form(
                key:_formKey ,
                child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    // number of axles
                    TextFormField(
                      controller: _inspectionIdController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Inspection id"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    // Axle 1
                    TextFormField(
                      controller: _inspectionHController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("inspection h"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _inspectionKmController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("inspection km"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _inspectionDateController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("inspection date weight"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    // Axle 2
                    TextFormField(
                      controller: _axle1WeightController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 1 weight"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _axle2WeightController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 2 weight"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _axle3WeightController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 3 weight"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    // Axle 3
                    TextFormField(
                      controller: _balastTypeAndPositionController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Balast type and position "),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _implementController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("implement"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.go,
                    ),
                    const SizedBox(height: 15,),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0),
                            side: const BorderSide(
                              width: 1,
                              color: Colors.black
                            )
                          )
                        ),
                      backgroundColor:MaterialStateProperty.all(Colors.white),
                      fixedSize: MaterialStateProperty.all(const Size(349, 48)),
                      textStyle:MaterialStateProperty.all(const TextStyle(fontSize: 16))),
                        onPressed: ()async{
                          if(_formKey.currentState.validate()){
                            final _inputInspection = {
                              "vehicle_id": widget.vehicleId,
                              "user_id" : _userId,
                              "inspection_id" : _inspectionIdController.text,
                              "inspection_h" : _inspectionHController.text,
                              "inspection_km" : _inspectionKmController.text,
                              "inspection_date" : _inspectionDateController.text,
                              "axle_1_weight" : _axle1WeightController.text,
                              "axle_2_weight" : _axle2WeightController.text,
                              "axle_3_weight" : _axle3WeightController.text,
                              "balast_type_and_position" : _balastTypeAndPositionController.text,
                              "implement" : _implementController.text,
                            };
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>InputTyreInspection(BL:widget.BL,tyreId:widget.tyreId, inspectionId:_inspectionIdController.text ,inputVehicle :widget.inputVehicle, inputTyre:widget.inputTyre, inputInspection: _inputInspection)));
                          }
                        },
                      child: const Text("Next" , 
                      style: TextStyle(
                        color: Color.fromRGBO(75, 174, 79,1)
                        ),
                      ),
                    ),
                  ],   
              ),
            ),
        ), 
      ),
    );
  }
}