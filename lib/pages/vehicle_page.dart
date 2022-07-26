import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/input/input_vehicle.dart';
import 'package:flutter_blue_app/pages/search_vehicle.dart';

class VehiclesPage extends StatefulWidget {
  var BL;
  VehiclesPage({Key key,this.BL}) : super(key: key);

  @override
  State<VehiclesPage> createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 80, 
                width: 300, 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 235, 47, 47), 
                      side: BorderSide(
                        width: 3,
                        color: Colors.redAccent
                      ), 
                      elevation: 3, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                        padding:EdgeInsets.all(20) 
                      ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => InputVehicle(BL:widget.BL)));
                  },
                  child: Text(
                    "Add vehicle",
                    style: TextStyle(fontSize: 23),
                  ),
                )
              )
            ),
            SizedBox(
              height: 45,
            ),
            Center(
              child: SizedBox(
                height: 80, 
                width: 300, 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 235, 47, 47), 
                      side: BorderSide(
                        width: 3,
                        color: Colors.redAccent
                      ), 
                      elevation: 3, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                        padding:EdgeInsets.all(20) 
                      ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SearchVehicle()));
                  },
                  child: Text(
                    "Find Vehicle",
                    style: TextStyle(fontSize: 23),
                  ),
                )
              )
            ),
          ],
        ));
  }
}