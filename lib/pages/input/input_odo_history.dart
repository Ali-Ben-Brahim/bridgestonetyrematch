import 'package:flutter/material.dart';

class InputOdoHistory extends StatefulWidget {
  const InputOdoHistory({Key key}) : super(key: key);

  @override
  State<InputOdoHistory> createState() => _InputOdoHistoryState();
}

class _InputOdoHistoryState extends State<InputOdoHistory> {

  final TextEditingController _vehicleIdController = TextEditingController();
  final TextEditingController _odoChangeDateController = TextEditingController();
  final TextEditingController _odoChangeKmHController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                    // vehicle id
                    TextFormField(
                      controller: _vehicleIdController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("vehicle id"),
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
                    // odo change date
                    TextFormField(
                      controller: _odoChangeDateController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("odo change date"),
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
                    // odo change km h
                    TextFormField(
                      controller: _odoChangeKmHController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("odo change km h"),
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
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            
                          }
                        },
                      child: const Text("Send" , 
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