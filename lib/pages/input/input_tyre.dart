// ignore_for_file: unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/input/input_inspection.dart';

class InputTyre extends StatefulWidget {
  var vehicleId;
  var inputVehicle;
  var BL;
  InputTyre({Key key,this.vehicleId, this.inputVehicle,this.BL}) : super(key: key);

  @override
  State<InputTyre> createState() => _InputTyreState();
}

class _InputTyreState extends State<InputTyre> {

  final TextEditingController _tyreIdController = TextEditingController();
  final TextEditingController _tyreModelIdController = TextEditingController();
  final TextEditingController _tyrePositionIdController = TextEditingController();
  final TextEditingController _fittingHController = TextEditingController();
  final TextEditingController _fittingKmController = TextEditingController();
  final TextEditingController _fittingRtdController = TextEditingController();
  final TextEditingController _fittingDateController = TextEditingController();
  final TextEditingController _activeController = TextEditingController();
  var _userId = FirebaseAuth.instance.currentUser.uid;
  

  
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("input tyre"),
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
                    // tyre model id
                    TextFormField(
                      controller: _tyreModelIdController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("tyre model id"),
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
                    // tyre id
                    TextFormField(
                      controller: _tyreIdController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("tyre id"),
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
                    // tyre position id
                    TextFormField(
                      controller: _tyrePositionIdController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("tyre position id"),
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
                    // fitting h
                    TextFormField(
                      controller: _fittingHController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("fitting h"),
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
                    // fitting km
                    TextFormField(
                      controller: _fittingKmController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("fitting km"),
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
                    // fitting RTD
                    TextFormField(
                      controller: _fittingRtdController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("fitting RTD"),
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
                    // active
                    TextFormField(
                      controller: _activeController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("active"),
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
                    // fitting date
                    TextFormField(
                      controller: _fittingDateController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("fitting date"),
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
                              final _inputTyre = {
                              "tyre_id" : _tyreIdController.text,
                              "tyre_model_id" : _tyreModelIdController.text,
                              "vehicle_id": widget.vehicleId,
                              "tyre_position_id" : _tyrePositionIdController.text,
                              "flitting_h" : _fittingHController.text,
                              "flitting_km" : _fittingKmController.text,
                              "flitting_rtd" : _fittingRtdController.text,
                              "flitting_date" : _fittingDateController.text,
                              "active" : _activeController.text,
                              "user_id" : _userId
                            };
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>InputInspection(BL:widget.BL, tyreId: _tyreIdController.text, vehicleId:widget.vehicleId, inputVehicle :widget.inputVehicle, inputTyre:_inputTyre)));
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