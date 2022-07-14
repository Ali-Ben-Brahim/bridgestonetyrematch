
// ignore_for_file: unused_field

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_blue_app/MainPage.dart';
class Login extends StatefulWidget {
  const Login({ Key key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  String string ="B2K22FC-70, &1, 33119, 30880, 24805, 22917, A, 0, 0, INT, 2500, 101259, 32, 123, 3#";

  var user;
  bool _isconnected = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController.text = 'ali@gmail.com';
    _passwordController.text = 'ali1234';
    print("${string.split(',')}");
    super.initState();
  }
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
    signIn()async{
      if(_formKey.currentState.validate()){
        try {
          UserCredential userCredential= await FirebaseAuth.instance.signInWithEmailAndPassword(
            email:  _emailController.text.trim(),
            password: _passwordController.text.trim()
          );
          return userCredential;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            AwesomeDialog(
              context: context,
              title: "Error",
              body: Text('No user found for that email')
            ).show();
            
          } else if (e.code == 'wrong-password') {
            AwesomeDialog(
              context: context,
              title: "Error",
              body: Text('Wrong password provided for that user')
            ).show();
            
          }
        }         
      }
    } 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        
        body:Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
              child : Form(
                key:_formKey ,
                child: Column(
                  children: [
                    //phrase connecter vous ...
                    const Padding(
                      padding:  const EdgeInsets.fromLTRB(30 ,0 ,30 , 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Connectez vous à votre compte",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ),
                    // Email
                    Container(
                      padding:  const EdgeInsets.fromLTRB(30 ,30 ,30 , 10),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value)=> value.isEmpty? 'veuillez saisir votre email' :null,
                        decoration:  InputDecoration(
                          label: const Text("Email"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 2,
                            )
                          ),
                          prefixIcon: const Icon(Icons.account_circle_outlined),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    //mot de passe
                    Container(
                      padding:  const EdgeInsets.fromLTRB(30 ,10 ,30 , 10),
                      child: TextFormField(
                        obscureText: true,
                       controller: _passwordController,
                        validator: (value)=> value.isEmpty? 'veuillez saisir votre mot de passe' :null,
                        decoration:  InputDecoration(
                          label: const Text("mot de passe"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 2,
                            )
                          ),
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        textInputAction: TextInputAction.go,
                      ),
                    ),
                    
                    
                    
                    Container(
                      width: double.infinity,
                      padding:  const EdgeInsets.fromLTRB(30 ,0 ,30 , 10),
                      child:ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0),
                            )
                          ),
                      backgroundColor:MaterialStateProperty.all(Colors.red),
                      fixedSize: MaterialStateProperty.all(const Size(349, 48)),
                      textStyle:MaterialStateProperty.all(const TextStyle(fontSize: 16))),
                        onPressed:()async{
                        
                          user = await signIn();
                          if(user !=null){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>MainPage()));
                          }
                        },
                        child: const Text('connecter'),
                        )
                    ),
                    
                  ],   
              ),
            )
          ),
        ),
    );
  }
}