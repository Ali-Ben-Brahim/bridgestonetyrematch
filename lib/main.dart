import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_blue_app/pages/home.dart';
import 'package:flutter_blue_app/pages/login.dart';
import 'package:flutter_blue_app/pages/static_page.dart';
import 'firebase_options.dart';
import 'package:splashscreen/splashscreen.dart';

bool islogin = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "splash screen",
    home: FirstActivity(),
  ));
}

class FirstActivity extends StatelessWidget {
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new MyApp(),
        title: new Text(
          "",
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset(
          "assets/images/b1.png",
          fit: BoxFit.contain,
          width: 300,
        ),
        photoSize: 120.0,
        loaderColor: Colors.red);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: islogin ? Staticpage() : Login(),
    );
  }
}
