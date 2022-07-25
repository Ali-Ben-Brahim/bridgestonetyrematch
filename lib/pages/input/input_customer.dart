import 'package:flutter/material.dart';

class InputCustomer extends StatefulWidget {
  const InputCustomer({Key key}) : super(key: key);

  @override
  State<InputCustomer> createState() => _InputCustomerState();
}

class _InputCustomerState extends State<InputCustomer> {

  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _serviceSoldToController = TextEditingController();
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
                    // customer name
                    TextFormField(
                      controller: _customerNameController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("customer name"),
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
                    // Country
                    TextFormField(
                      controller: _countryController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Country "),
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
                    // Region
                    TextFormField(
                      controller: _regionController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Region"),
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
                    // service sold to
                    TextFormField(
                      controller: _serviceSoldToController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("service sold to"),
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