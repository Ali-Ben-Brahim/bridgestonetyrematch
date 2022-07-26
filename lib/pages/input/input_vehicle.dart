// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/input/input_tyre.dart';

class InputVehicle extends StatefulWidget {
  var BL;
  InputVehicle({Key key,this.BL}) : super(key: key);

  @override
  State<InputVehicle> createState() => _InputVehicleState();
}

class _InputVehicleState extends State<InputVehicle> {

  final TextEditingController _vehicleIdController = TextEditingController();
  final TextEditingController _vehicleModelIdController = TextEditingController();
  final TextEditingController _registrationController = TextEditingController();
  final TextEditingController _measuredIarController = TextEditingController();
  final TextEditingController _numberOfAxlesController = TextEditingController();
  final TextEditingController _axle1SizeController = TextEditingController();
  final TextEditingController _axle1TyreController = TextEditingController();
  final TextEditingController _axle1MaxWeightController = TextEditingController();
  final TextEditingController _axle2SizeController = TextEditingController();
  final TextEditingController _axle2TyreController = TextEditingController();
  final TextEditingController _axle2MaxWeightController = TextEditingController();
  final TextEditingController _axle3SizeController = TextEditingController();
  final TextEditingController _axle3TyreController = TextEditingController();
  final TextEditingController _axle3MaxWeightController = TextEditingController();
  final TextEditingController _webFleetController = TextEditingController();
  final TextEditingController _operationIdController = TextEditingController();
  var _userId = FirebaseAuth.instance.currentUser.uid;
  
  
  final _formKey = GlobalKey<FormState>();
  String selectedApplication ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("input vehicle"),
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
                    // Vehicle id
                    TextFormField(
                      controller: _vehicleIdController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Vehicle id"),
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
                    // Vehicle model id
                    TextFormField(
                      controller: _vehicleModelIdController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Vehicle model id"),
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
                    // registration number
                    TextFormField(
                      controller: _registrationController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("registration number"),
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
                      controller: _measuredIarController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("measured iar"),
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
                    // number of axles
                    TextFormField(
                      controller: _numberOfAxlesController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Number of axles"),
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
                      controller: _axle1SizeController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("axle 1 size"),
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
                      controller: _axle1TyreController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 1 tyre"),
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
                      controller: _axle1MaxWeightController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 1 max weight"),
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
                      controller: _axle2SizeController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 2 size"),
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
                      controller: _axle2TyreController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 2 tyre"),
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
                      controller: _axle2MaxWeightController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 2 max weight"),
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
                      controller: _axle3SizeController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 3 size"),
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
                      controller: _axle3TyreController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 3 tyre"),
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
                      controller: _axle3MaxWeightController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 3 max weight"),
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
                      controller: _webFleetController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Web fleet"),
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
                      controller: _operationIdController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Operation id"),
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
                            // final _fireStore = await FirebaseFirestore.instance.collection("Vehicles").add({
                            //   "vehicle_id": _vehicleIdController.text,
                            //   "vehicle_model_id" : _vehicleModelIdController.text,
                            //   "registration_number" : _registrationController.text,
                            //   "measured_iar" : _measuredIarController.text,
                            //   "number_of_axles" : _numberOfAxlesController.text,
                            //   "axle_1_size" : _axle1SizeController.text,
                            //   "axle_1_tyre" : _axle1TyreController.text,
                            //   "axle_1_max_weight" : _axle2MaxWeightController.text,
                            //   "axle_2_size" : _axle2SizeController.text,
                            //   "axle_2_tyre" : _axle2TyreController.text,
                            //   "axle_2_max_weight" : _axle2MaxWeightController.text,
                            //   "axle_3_size" : _axle3SizeController.text,
                            //   "axle_3_tyre" : _axle3TyreController.text,
                            //   "axle_3_max_weight" : _axle3MaxWeightController.text,
                            //   "webFleet" : _webFleetController.text,
                            //   "operation_id" : _operationIdController.text,
                            //   "user_id" : _userId
                            // });
                            final _inputVehicle ={
                              "vehicle_id": _vehicleIdController.text,
                              "vehicle_model_id" : _vehicleModelIdController.text,
                              "registration_number" : _registrationController.text,
                              "measured_iar" : _measuredIarController.text,
                              "number_of_axles" : _numberOfAxlesController.text,
                              "axle_1_size" : _axle1SizeController.text,
                              "axle_1_tyre" : _axle1TyreController.text,
                              "axle_1_max_weight" : _axle2MaxWeightController.text,
                              "axle_2_size" : _axle2SizeController.text,
                              "axle_2_tyre" : _axle2TyreController.text,
                              "axle_2_max_weight" : _axle2MaxWeightController.text,
                              "axle_3_size" : _axle3SizeController.text,
                              "axle_3_tyre" : _axle3TyreController.text,
                              "axle_3_max_weight" : _axle3MaxWeightController.text,
                              "webFleet" : _webFleetController.text,
                              "operation_id" : _operationIdController.text,
                              "user_id" : _userId
                            };

                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>InputTyre(BL:widget.BL,vehicleId: _vehicleIdController.text,inputVehicle :_inputVehicle)));
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