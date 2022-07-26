// ignore_for_file: unused_field, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/input/input_photograph.dart';

class InputTyreInspection extends StatefulWidget {
  var BL;
  var tyreId;
  var inputVehicle;
  var inspectionId;
  var inputTyre;
  var inputInspection;
  InputTyreInspection({Key key, this.BL, this.tyreId, this.inspectionId, this.inputVehicle, this.inputTyre, this.inputInspection}) : super(key: key);

  @override
  State<InputTyreInspection> createState() => _InputTyreInspectionState();
}

class _InputTyreInspectionState extends State<InputTyreInspection> {

  
  final TextEditingController _tyrePositionIdController = TextEditingController();
  final TextEditingController _inspectionRTDController = TextEditingController();
  final TextEditingController _inspectionIPController = TextEditingController();
  final TextEditingController _mountedController = TextEditingController();
  final TextEditingController _damageId1Controller = TextEditingController();
  final TextEditingController _damageId2Controller = TextEditingController();
  final TextEditingController _damageId3Controller = TextEditingController();
  
  final String _userIdController = FirebaseAuth.instance.currentUser.uid;


  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("input tyre inspection"),
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
                    // inspection RTD
                    TextFormField(
                      controller: _inspectionRTDController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("inspection RTD"),
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
                    // inspection ip
                    TextFormField(
                      controller: _inspectionIPController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("inspection ip"),
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
                    // mounted
                    TextFormField(
                      controller: _mountedController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("mounted"),
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
                    // damage id 1
                    TextFormField(
                      controller: _damageId1Controller,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("damage id 1"),
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
                    // damage id 2
                    TextFormField(
                      controller: _damageId2Controller,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("damage id 2"),
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
                    // damage id 3
                    TextFormField(
                      controller: _damageId3Controller,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("damage id 3"),
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
                              final _inputTyreInspection ={
                              "inspection_id" : widget.inspectionId,
                              "tyre_id": widget.tyreId,
                              "tyre_position_id" : _tyrePositionIdController.text,
                              "inspection_rtd" : _inspectionRTDController.text,
                              "inspection_ip" : _inspectionIPController.text,
                              "mounted" : _mountedController.text,
                              "damage_id_1" : _damageId1Controller.text,
                              "damage_id_2" : _damageId2Controller.text,
                              "damage_id_3" : _damageId3Controller.text,
                            };
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>InputPhotographs(BL:widget.BL, inspectionId:widget.inspectionId, tyreId:widget.tyreId,inputVehicle :widget.inputVehicle, inputTyre:widget.inputTyre, inputInspection: widget.inputInspection, inputTyreInspection: _inputTyreInspection)));  
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