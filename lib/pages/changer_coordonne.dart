import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_blue_app/pages/login.dart';

class ChangerCoordonne extends StatefulWidget {
  @override
  _ChangercoordCnneState createState() => _ChangercoordCnneState();
}

class _ChangercoordCnneState extends State<ChangerCoordonne> {
  User _user = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  var userCredential = FirebaseAuth.instance.currentUser;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _currentpasswordController =TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _newPasswordVisible =false;
  bool _passwordVisible =false;
  bool _passwordvalidation =false;
  void initState() {
    print(_user);
    print(_user.email);
    _emailController.text = _user.email;
    _passwordController.text = '';
    _currentpasswordController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Mes informations'),
          backgroundColor: Color.fromRGBO(75, 174, 79, 1),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "E-mail : ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: 10),
                  //E-mail
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      label: const Text(" E-mail "),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )),
                      prefixIcon: const Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return ' veuillez saisir votre adresse Email ';
                      }
                      if (!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(value)) {
                        return ' please write your email  ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Password : ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: !_passwordVisible,
                    controller: _currentpasswordController,
                    decoration: InputDecoration(
                      label: const Text("current password "),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )),
                      prefixIcon: const Icon(Icons.abc),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: (){
                          setState(() {
                              _passwordVisible = !_passwordVisible;
                          });
                        },
                      )
                    ),
                    validator: (value) =>
                        value.isEmpty ? ' please write the password ' : null,
                  ),
                  _passwordvalidation?Container():Text("The password not correct",style: TextStyle(color:Colors.red),),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: !_newPasswordVisible,
                    controller: _newPasswordController,
                    decoration: InputDecoration(
                      label: const Text("new password "),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )),
                      prefixIcon: const Icon(Icons.abc),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _newPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: (){
                          setState(() {
                              _newPasswordVisible = !_newPasswordVisible;
                          });
                        },
                      )
                    ),
                    validator: (value) =>
                        value.isEmpty ? ' please write the password ' : null,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: !_passwordVisible,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      label: const Text("confirm password"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                      ),
                      prefixIcon: const Icon(Icons.abc),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: (){
                          setState(() {
                              _passwordVisible = !_passwordVisible;
                          });
                        },
                      )
                    ),
                    validator: (value) =>
                        value.isEmpty ? 'please write the password' : value !=_newPasswordController.text? "the password aren't the same": null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(75, 174, 79, 1),
                        ),
                        onPressed: () async {
                          // await userCredential.reauthenticateWithCredential(credential);
                          if(_formKey.currentState.validate()){
                            var cred = EmailAuthProvider.credential(
                                email: userCredential.email,
                                password: _currentpasswordController.text.trim());
                            await userCredential.reauthenticateWithCredential(cred).then((value) {
                              userCredential.updatePassword(_passwordController.text.trim()).then((_) {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => Login()));
                              }).catchError((error) {
                                setState(() {
                                  _passwordvalidation =true;
                                });
                              });
                            }).catchError((err) {});
                          }
                        },
                        child: const Text('changer'),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
